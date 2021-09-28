const fs = require('fs');

const pollUrl = process.env.POLL_URL;
const swaggerRoot = process.env.SWAGGER_ROOT || '/usr/share/nginx/html';
const swaggerConfigFile = `${swaggerRoot}/swagger-config.json`;

if (!fs.existsSync(swaggerRoot)) {
    console.log('INFO: creating directory ', swaggerRoot);
    fs.mkdirSync(swaggerRoot, {recursive: true});
}

const getterForUrl = (url) => {
    let getter;
    if (url.startsWith('https')) {
        getter = require('https');
    } else {
        getter = require('http');
    }

    return {
        get: (callback) => getter.get(url, callback)
    };
}

const pollApiFile = (fileName, url) => {
    console.log('TRACE: poll API file: ', fileName);

    const writeStream = fs.createWriteStream(`${swaggerRoot}/${fileName}`);
    getterForUrl(url).get((response) => response.pipe(writeStream));
}

const pollApiFiles = (fileConfigs) => {
    const nginxRoot = swaggerRoot.replace('/usr/share/nginx/html', '');
    const localConfigs = [];

    fileConfigs.forEach(fileConfig => {
        const fileName = fileConfig.url.split('/').pop();
        pollApiFile(fileName, fileConfig.url);
        localConfigs.push({url: `${nginxRoot}/${fileName}`, name: fileConfig.name});
    });

    return localConfigs;
}

const poll = () => {
    console.log('DEBUG: polling from: ', pollUrl);
    console.log('DEBUG: polling to  : ', swaggerConfigFile);

    getterForUrl(pollUrl).get((response) => {
        let buffer = '';
        response
            .on('data', (chunk) => buffer += chunk)
            .on('end', () => {
                const swaggerConfig = JSON.parse(buffer);
                swaggerConfig.urls = pollApiFiles(swaggerConfig.urls);

                console.log('TRACE: write swagger-config.json: ', swaggerConfig);
                fs.writeFileSync(swaggerConfigFile, JSON.stringify(swaggerConfig));
            })
            .on('error', (error) => console.log('ERROR: ', error));
    });
}

const pollIntervalSeconds = process.env.POLL_INTERVAL_SECONDS || 300;

console.log(`INFO: start polling all ${pollIntervalSeconds} seconds..`);

poll();
setInterval(poll, pollIntervalSeconds * 1000);
