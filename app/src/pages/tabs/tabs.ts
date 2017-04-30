import { Component } from '@angular/core';

import { NavParams } from 'ionic-angular';

import { KegiatanPage } from '../kegiatan/kegiatan';
import { BerandaPage } from '../beranda/beranda';
import { UndanganPage } from '../undangan/undangan';
import { ProfilPage } from '../profil/profil';


@Component({
  templateUrl: 'tabs.html'
})
export class TabsPage {
  // set the root pages for each tab
  tab1Root: any = BerandaPage;
  tab2Root: any = KegiatanPage;
  tab3Root: any = UndanganPage;
  tab4Root: any = ProfilPage;
  mySelectedIndex: number;

  constructor(navParams: NavParams) {
    this.mySelectedIndex = navParams.data.tabIndex || 0;
  }

}
