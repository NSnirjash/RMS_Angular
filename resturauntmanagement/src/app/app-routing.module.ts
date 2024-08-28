import { createComponent, NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ShowmenuComponent } from './menu-managemaent/showmenu/showmenu.component';
import { CreatemenuComponent } from './menu-managemaent/createmenu/createmenu.component';
import { UpdatemenuComponent } from './menu-managemaent/updatemenu/updatemenu.component';
import { TablemanagementComponent } from './tablemanagement/tablemanagement.component';
import { ReservetableComponent } from './admin/reservetable/reservetable.component';
import { ShowstaffComponent } from './admin/staff/showstaff/showstaff.component';
import { CreatestaffComponent } from './admin/staff/createstaff/createstaff.component';

const routes: Routes = [
  { path: '', redirectTo: '/menu', pathMatch: 'full' },
  {path:"menu", component: ShowmenuComponent},
  {path:"create", component: CreatemenuComponent},
  {path: "update/:id", component: UpdatemenuComponent},
  { path: 'tablereserve', component: TablemanagementComponent },
  { path: 'tableappreove', component: ReservetableComponent },
  { path: 'showstaff', component: ShowstaffComponent },
  { path: 'createstaff', component: CreatestaffComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
