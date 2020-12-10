import * as elasticsearch from 'elasticsearch';

const searchClient = elasticsearch.Client({
    host: `http://${process.env.ELASTICSEARCH_HOST}:9200`
});
export {
    elasticsearch,
    searchClient
}
