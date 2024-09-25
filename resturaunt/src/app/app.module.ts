import { NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SavefoodComponent } from './food/savefood/savefood.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { provideHttpClient, withFetch } from '@angular/common/http';
import { NavbarComponent } from './nav/navbar/navbar.component';
import { SidebarComponent } from './nav/sidebar/sidebar.component';
import { FooterComponent } from './nav/footer/footer.component';
import { ViewfoodComponent } from './food/viewfood/viewfood.component';

@NgModule({
  declarations: [
    AppComponent,
    SavefoodComponent,
    NavbarComponent,
    SidebarComponent,
    FooterComponent,
    ViewfoodComponent
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
