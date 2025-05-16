import {Module} from '@nestjs/common';
import {AppController} from './app.controller';
import {AppService} from './app.service';
import {ServeStaticModule} from '@nestjs/serve-static';
import {join} from 'path';


const WEB_BUNDLE_DIR = join(process.cwd(), 'public/browser');


@Module({
  imports: [
    ServeStaticModule.forRoot({
      rootPath: WEB_BUNDLE_DIR,
      exclude: ['/api/{*path}'],
    })
  ],
  controllers: [],
  providers: [AppService],
})
export class AppModule {}
