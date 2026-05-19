const bucketName = process.env.MESSAGES_BUCKET;

const handler = async (event) => {
    console.log(bucketName)
    const response = {
        statusCode: 200,
        body: JSON.stringify({
            message: 'Hello from Lambda'
        })
    };
    return response;
};

export {handler};