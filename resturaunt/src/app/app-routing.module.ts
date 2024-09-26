import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SavefoodComponent } from './food/savefood/savefood.component';
import { ViewfoodComponent } from './food/viewfood/viewfood.component';
import { UpdatefoodComponent } from './food/updatefood/updatefood.component';
import { SavetableComponent } from './table/savetable/savetable.component';
import { ViewtableComponent } from './table/viewtable/viewtable.component';
import { UpdatetableComponent } from './table/updatetable/updatetable.component';

const routes: Routes = [
  {path: "savefood" , component: SavefoodComponent},
  {path: "viewfood" , component: ViewfoodComponent},
  {path: "updatefood/:id" , component: UpdatefoodComponent},
  {path: "savetable" , component: SavetableComponent},
  {path: "viewtable" , component: ViewtableComponent},
  {path: "updatetable/:id" , component: UpdatetableComponent},

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
