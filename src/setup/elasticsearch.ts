import * as elasticsearch from 'elasticsearch';

const searchClient = elasticsearch.Client({
    node: 'localhost:9200'
});
export {
    elasticsearch,
    searchClient
}
