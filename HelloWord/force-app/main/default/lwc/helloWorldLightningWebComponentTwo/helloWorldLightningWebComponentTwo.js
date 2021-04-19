import { LightningElement } from 'lwc';

export default class HelloWorldLightningWebComponentTwo extends LightningElement {
    greeting = 'World';
    changeHandler(event) {
      this.greeting = event.target.value;
    }
}