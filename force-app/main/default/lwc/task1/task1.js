import { LightningElement, wire } from 'lwc';
import searchAccountNames from  '@salesforce/apex/contactUtility.searchAccountNames'

export default class Task1 extends LightningElement {
    cols = [
        {label:'Id',fieldName:'Id'},
        {label:'Name', fieldName:'Name'}
    ];

    searchKey = 'a';
    
    
    handleKeyChange(event){
        window.clearTimeout(this.delayTimeout);
        const searchKey = event.target.value;
        this.delayTimeout = setTimeout(() => {
            this.searchKey = searchKey;
        }, 300);
    }
    
    @wire(searchAccountNames,{searchkey:'$searchKey'}) mywiremethod;
}