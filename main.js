Parse.Cloud.define('emailExists', async ({ params: { email } }) => { 
    return await (new Parse.Query(Parse.User).equalTo("email", email).count({ useMasterKey: true })) > 0 
});

Parse.Cloud.define('getChecklist', async ({ params: { username } }) => { 
    return await (new Parse.Query(Parse.Checklist).equalTo("username", username).count({ useMasterKey: true }))
});