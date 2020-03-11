var jcontent = {
    "Application": "Webapp1",
    "Version": "1.0.0",
    "Request_Count" : "100010000",
    "Error_Count": "11111110",
    "Success_Count": "1111111"     
}
var output = document.getElementById('output');

output.innerHTML = jcontent.Application + ' ' ;
                + jcontent.Version + ' ' ;
                + jcontent.Request_Count + ' ' ;
                + jcontent.Error_Count + ' ' ;
                + jcontent.Success_Count;

