import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SavefoodComponent } from './food/savefood/savefood.component';
import { ViewfoodComponent } from './food/viewfood/viewfood.component';

const routes: Routes = [
  {path: "savefood" , component: SavefoodComponent},
  {path: "viewfood" , component: ViewfoodComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
