const bucketName = process.env.MESSAGE_BUCKET;

export const handler = async (event) => {
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