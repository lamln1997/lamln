const rabbitmqConfig = {
    url: `amqp://${process.env.RABBIT_HOST}`,
    nameQueue: 'insert-data-elasticseach'
}
export {
    rabbitmqConfig
}
