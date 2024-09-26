import { NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SavefoodComponent } from './food/savefood/savefood.component';
import { FormControl, FormsModule, ReactiveFormsModule } from '@angular/forms';
import { provideHttpClient, withFetch } from '@angular/common/http';
import { NavbarComponent } from './nav/navbar/navbar.component';
import { SidebarComponent } from './nav/sidebar/sidebar.component';
import { FooterComponent } from './nav/footer/footer.component';
import { ViewfoodComponent } from './food/viewfood/viewfood.component';
import { UpdatefoodComponent } from './food/updatefood/updatefood.component';
import { SavetableComponent } from './table/savetable/savetable.component';
import { ViewtableComponent } from './table/viewtable/viewtable.component';
import { UpdatetableComponent } from './table/updatetable/updatetable.component';

@NgModule({
  declarations: [
    AppComponent,
    SavefoodComponent,
    NavbarComponent,
    SidebarComponent,
    FooterComponent,
    ViewfoodComponent,
    UpdatefoodComponent,
    SavetableComponent,
    ViewtableComponent,
    UpdatetableComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule
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
