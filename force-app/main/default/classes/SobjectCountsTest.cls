@isTest
private class SobjectCountsTest {
    @isTest
    static void testCreateCase() {
        // Test data
        List<String> sobjectNames = new List<String>{'Account', 'Contact'};
        
        // Mocking data
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        Contact testContact = new Contact(FirstName = 'Test', LastName = 'Contact', AccountId = testAccount.Id);
        insert testContact;
        
        Test.startTest();
        // Call the method to test
        Map<String, Integer> result = SobjectCounts.createCase(sobjectNames);
        Test.stopTest();
        
        // Assertions
        System.assertEquals(1, result.get('Account'), 'Account count should be 1');
        System.assertEquals(1, result.get('Contact'), 'Contact count should be 1');
    }   
    @isTest
    static void testCreateCaseWithEmptyList() {
        // Test data
        List<String> sobjectNames = new List<String>();
        
        Test.startTest();
        // Call the method to test
        Map<String, Integer> result = SobjectCounts.createCase(sobjectNames);
        Test.stopTest();
        
        // Assertions
        System.assertEquals(0, result.size(), 'Result should be empty');
    }
}