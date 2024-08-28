import { NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './nav/navbar/navbar.component';
import { SidenavComponent } from './nav/sidenav/sidenav.component';
import { ShowmenuComponent } from './menu-managemaent/showmenu/showmenu.component';
import { CreatemenuComponent } from './menu-managemaent/createmenu/createmenu.component';
import { UpdatemenuComponent } from './menu-managemaent/updatemenu/updatemenu.component';
import {  HttpClientModule, provideHttpClient, withFetch } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { TablemanagementComponent } from './tablemanagement/tablemanagement.component';
import { ReservetableComponent } from './admin/reservetable/reservetable.component';
import { ShowstaffComponent } from './admin/staff/showstaff/showstaff.component';
import { CreatestaffComponent } from './admin/staff/createstaff/createstaff.component';
import { UpdatestaffComponent } from './admin/staff/updatestaff/updatestaff.component'; 
import { RouterModule } from '@angular/router';

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    SidenavComponent,
    ShowmenuComponent,
    CreatemenuComponent,
    UpdatemenuComponent,
    TablemanagementComponent,
    ReservetableComponent,
    ShowstaffComponent,
    CreatestaffComponent,
    UpdatestaffComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule,
    HttpClientModule,
    FormsModule,
    RouterModule
  ],
  providers: [
    provideClientHydration(),
    provideHttpClient(
      withFetch()
    )
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
