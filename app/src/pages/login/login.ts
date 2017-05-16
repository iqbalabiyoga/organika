import { Component } from '@angular/core';
import { NgForm } from '@angular/forms';

import { NavController } from 'ionic-angular';

import { Auth } from '../../providers/auth';

import { TabsPage } from '../tabs/tabs';
import { MulaiPage } from '../mulai/mulai';
// import { Storage } from '@ionic-storage';


@Component({
  selector: 'page-user',
  templateUrl: 'login.html'
})
export class LoginPage {
  login: {username?: string, password?: string} = {};
  submitted = false;

  constructor(public navCtrl: NavController, public auth: Auth) { }

  onLogin(form: NgForm) {
    this.submitted = true;

    if (form.valid) {
      // this.auth.login(this.login.username);
      this.navCtrl.push(TabsPage);
    }
  }

 // onSignup() {
 //  this.navCtrl.push(MulaiPage);
 // }
}
