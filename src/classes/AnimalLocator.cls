public with sharing class AnimalLocator {
	
	public static string getAnimalNameById(Integer num){
		string str ='';
		
		Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+num);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
         // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            // Cast the values in the 'animals' key as a list
           Map<String, Object> animalProperties = (Map<String, Object>) results.get('animal');
            
            str= (string) animalProperties.get('name');
        }

        
		return str;
	}
    
}