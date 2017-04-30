import { NgModule, ErrorHandler } from '@angular/core';
import { IonicApp, IonicModule, IonicErrorHandler } from 'ionic-angular';
import { MyApp } from './app.component';
import { KegiatanPage } from '../pages/kegiatan/kegiatan';
import { ProfilPage } from '../pages/profil/profil';
import { BerandaPage } from '../pages/beranda/beranda';
import { UndanganPage } from '../pages/undangan/undangan';
import { TabsPage } from '../pages/tabs/tabs';
import {LeaderboardPage} from '../pages/leaderboard/leaderboard';
@NgModule({
  declarations: [
    MyApp,
    TabsPage,
    KegiatanPage,
    BerandaPage,
    UndanganPage,
    ProfilPage,
    LeaderboardPage,
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
    UndanganPage,
    ProfilPage,
    LeaderboardPage,
  ],
  providers: [{provide: ErrorHandler, useClass: IonicErrorHandler}]
})
export class AppModule {}
