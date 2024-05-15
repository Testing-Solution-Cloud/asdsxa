@RestResource(urlMapping='/sobjectcount/*')
global with sharing class SobjectCounts {
@HttpPost
global static Map<String, Integer> createCase(List<String> sobjectNames) {
    Map<String, Integer> output = new Map<String, Integer>();
    for(Integer j = 0; j < sobjectNames.size() ; j++) {
        List<Object> result = new List<Object>();
        String obj = sobjectNames[j];
        String queryString = 'SELECT COUNT() FROM ' + obj;
        Integer recordCount = Database.countQuery(queryString);
            output.put(obj, recordCount);
        }
    return output;
    }
}