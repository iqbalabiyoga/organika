import { NgModule, ErrorHandler } from '@angular/core';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';
import { MyApp } from './app.component';
import { KegiatanPage } from '../pages/kegiatan/kegiatan';
import { ProfilPage } from '../pages/profil/profil';
import { BerandaPage } from '../pages/beranda/beranda';
import { DokumentasiPage } from '../pages/dokumentasi/dokumentasi';
import { UndanganPage } from '../pages/undangan/undangan';
import { TabsPage } from '../pages/tabs/tabs';
import {LeaderboardPage} from '../pages/leaderboard/leaderboard';
import { MulaiPage } from '../pages/mulai/mulai';
import { LoginPage } from '../pages/login/login';
import { LaporanPage } from '../pages/laporan/laporan';
import { Auth } from '../providers/auth';
import { Storage } from '@ionic/storage';
import { Camera } from '@ionic-native/camera';


@NgModule({
  declarations: [
    MyApp,
    TabsPage,
    KegiatanPage,
    BerandaPage,
    DokumentasiPage,
    UndanganPage,
    ProfilPage,
    LeaderboardPage,
    LoginPage,
    LaporanPage,
  ],
  imports: [
    IonicModule.forRoot(MyApp)
  ],
  bootstrap: [IonicApp],
  entryComponents: [
    MyApp,
    TabsPage,
    KegiatanPage,
    BerandaPage,
    DokumentasiPage,
    UndanganPage,
    ProfilPage,
    LeaderboardPage,
    LoginPage,
    LaporanPage,
  ],
  providers: [
    {provide: Storage, useClass: IonicErrorHandler}, 
    Auth,
    Camera
  ]
})
export class AppModule {}
