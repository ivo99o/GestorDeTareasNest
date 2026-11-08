import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { UsuariosModule } from '../usuarios/usuarios.module';
import { CategoriasModule } from '../categorias/categorias.module';
import { TareasModule } from '../tareas/tareas.module';
import { AuthModule } from '../auth/auth.module';

@Module({
  imports: [UsuariosModule, CategoriasModule, TareasModule, AuthModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
