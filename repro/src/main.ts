import { Client } from "pulsar-client";

console.log('Starting pulsar client');

const client = new Client({
    serviceUrl: 'pulsar://localhost:6650',
});

const producer = await client.createProducer({
    topic: 'test-topic',
});

console.log(producer.isConnected());
