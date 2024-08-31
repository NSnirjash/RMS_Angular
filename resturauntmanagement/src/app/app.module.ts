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
import { ShowcustomerComponent } from './customer/showcustomer/showcustomer.component';
import { CreatecustomerComponent } from './customer/createcustomer/createcustomer.component';
import { UpdatecustomerComponent } from './customer/updatecustomer/updatecustomer.component';
<<<<<<< Updated upstream
import { ShoworderComponent } from './order/showorder/showorder.component';
import { UpdateorderComponent } from './order/updateorder/updateorder.component';
import { DeleteorderComponent } from './order/deleteorder/deleteorder.component';
import { CreateorderComponent } from './order/createorder/createorder.component';
import { ConfirmorderComponent } from './confirmorder/confirmorder.component';
import { RegistrationComponent } from './auth/registration/registration.component';
import { LoginComponent } from './auth/login/login.component';
import { LogoutComponent } from './auth/logout/logout.component';
import { UserprofileComponent } from './userprofile/userprofile.component';
=======
import { DeletecustomerComponent } from './customer/deletecustomer/deletecustomer.component';
>>>>>>> Stashed changes

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
    UpdatestaffComponent,
    ShowcustomerComponent,
    CreatecustomerComponent,
    UpdatecustomerComponent,
<<<<<<< Updated upstream
    ShoworderComponent,
    UpdateorderComponent,
    DeleteorderComponent,
    CreateorderComponent,
    ConfirmorderComponent,
    RegistrationComponent,
    LoginComponent,
    LogoutComponent,
    UserprofileComponent
=======
    DeletecustomerComponent
>>>>>>> Stashed changes
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
