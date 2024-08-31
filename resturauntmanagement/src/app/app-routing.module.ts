import { createComponent, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ShowmenuComponent } from './menu-managemaent/showmenu/showmenu.component';
import { CreatemenuComponent } from './menu-managemaent/createmenu/createmenu.component';
import { UpdatemenuComponent } from './menu-managemaent/updatemenu/updatemenu.component';
import { TablemanagementComponent } from './tablemanagement/tablemanagement.component';
import { ReservetableComponent } from './admin/reservetable/reservetable.component';
import { ShowstaffComponent } from './admin/staff/showstaff/showstaff.component';
import { CreatestaffComponent } from './admin/staff/createstaff/createstaff.component';
<<<<<<< Updated upstream
import { ShowcustomerComponent } from './customer/showcustomer/showcustomer.component';
import { CreatecustomerComponent } from './customer/createcustomer/createcustomer.component';
import { UpdatecustomerComponent } from './customer/updatecustomer/updatecustomer.component';
import { ShoworderComponent } from './order/showorder/showorder.component';
import { CreateorderComponent } from './order/createorder/createorder.component';
import { UpdateorderComponent } from './order/updateorder/updateorder.component';
import { ConfirmorderComponent } from './confirmorder/confirmorder.component';
import { RegistrationComponent } from './auth/registration/registration.component';
import { LoginComponent } from './auth/login/login.component';
import { AuthGuard } from './guard/authguard.guard';
import { LogoutComponent } from './auth/logout/logout.component';
import { UserprofileComponent } from './userprofile/userprofile.component';

=======
import { UpdatestaffComponent } from './admin/staff/updatestaff/updatestaff.component';
import { ShowcustomerComponent } from './customer/showcustomer/showcustomer.component';
import { CreatecustomerComponent } from './customer/createcustomer/createcustomer.component';
import { UpdatecustomerComponent } from './customer/updatecustomer/updatecustomer.component';
>>>>>>> Stashed changes

const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path:"menu", component: ShowmenuComponent},
  { path:"create", component: CreatemenuComponent, canActivate:[AuthGuard]},
  { path: "update/:id", component: UpdatemenuComponent, canActivate:[AuthGuard]},
  { path: 'tablereserve', component: TablemanagementComponent, canActivate:[AuthGuard] },
  { path: 'tableappreove', component: ReservetableComponent, canActivate:[AuthGuard] },
  { path: 'showstaff', component: ShowstaffComponent },
<<<<<<< Updated upstream
  { path: 'createstaff', component: CreatestaffComponent, canActivate:[AuthGuard] },
  { path: 'customers', component: ShowcustomerComponent, canActivate:[AuthGuard] },
  { path: 'createcustomer', component: CreatecustomerComponent, canActivate:[AuthGuard] },
  { path: 'updatecustomer/:id', component: UpdatecustomerComponent, canActivate:[AuthGuard] },
  { path: 'orders', component: ShoworderComponent, canActivate:[AuthGuard] },
  { path: 'createorder', component: CreateorderComponent , canActivate:[AuthGuard]},
  { path: 'updateorder/:orderId', component: UpdateorderComponent, canActivate:[AuthGuard] },
  { path: 'confirmorder', component: ConfirmorderComponent , canActivate:[AuthGuard]},
  { path: 'reg', component: RegistrationComponent },
  { path: 'login', component: LoginComponent },
  { path: 'logout', component: LogoutComponent },
  { path: 'userprofile', component: UserprofileComponent, canActivate:[AuthGuard] },
  { path: '**', redirectTo: 'login', pathMatch: 'full' },
=======
  { path: 'createstaff', component: CreatestaffComponent },
  { path: 'updatestaff/:id', component: UpdatestaffComponent },
  { path: 'customer', component: ShowcustomerComponent },
  { path: 'crestecustomer', component: CreatecustomerComponent },
  { path: 'updatecustomer/:id', component: UpdatecustomerComponent },
>>>>>>> Stashed changes
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
