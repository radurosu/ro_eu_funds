var request = require('request'),
    cheerio = require('cheerio'),
    _ = require('lodash'),
    fs = require('fs'),
    path = require('path'),
    url = 'http://data.gov.ro/dataset/informatii-derulare-fonduri-europene-smis',
    download_path = 'downloads2';

request(url, function(error, response, body) {
    if (!error && response.statusCode === 200) {
        var $ = cheerio.load(body),
            links = $('a.resource-url-analytics');

        _.each(links, function(link, index) {
            var href = link.attribs.href,
                name = href.split('/').slice(-1)[0];

            console.log('Downloading', href);

            request({
                url: href,
                encoding: 'binary'
            }, function(_error, _response, _body) {
                if (!_error && _response.statusCode === 200) {
                    console.log('Writing', href);

                    fs.writeFileSync(path.join(download_path, name), _body, {
                        encoding: 'binary'
                    });
                } else {
                    console.error(_error, _response.statusCode);
                }
            });
        });
    } else {
        console.error(error, response.statusCode);
    }
});
