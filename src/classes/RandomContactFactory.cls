public class RandomContactFactory {

  public static List<Contact> generateRandomContacts(Integer num, String name){
  	List<Contact> liContacts = new List<Contact>();
  	
  	for(integer i=0; i<num;i++)	{
  		liContacts.add(new Contact(LastName=name,
  								firstName='Test '+i));  		
  	}//end for
  	
  	return liContacts;
  	
  }//end methode
  
  
}