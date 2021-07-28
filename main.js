Parse.Cloud.define('emailExists', async ({ params: { email } }) => { 
    return await (new Parse.Query(Parse.User).equalTo("email", email).count({ useMasterKey: true })) > 0 
});