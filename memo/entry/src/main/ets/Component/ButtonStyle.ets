import { text } from '@kit.ArkGraphics2D'
@Component
export default struct ButtonStyle{

 // @State backgroundImageIndex: number = 0; // 当前选择的壁纸的索引

  // 两种内置的壁纸的路径
 /* backgroundImages: Resource[] = [
    $r('app.media.123'),
    $r('app.media.background1'),
    $r('app.media.background2'),
    $r('app.media.background3')
  ];
*/

  build() {
      Column() {
        Button('更改壁纸')
          .backgroundColor('rgba(255, 255, 255, 0.5)') // 设置背景色为半透明的白色
          .borderRadius('50%') // 设置边框半径为50%，使其成为圆形
          .width(100)
          .height(40)
          .fontSize(10)
          .fontColor('#000000')
          .margin({left:0,bottom:0})
          //.onClick(() => this.background()) // 点击编辑图标时，切换到下一种壁纸
      }
    }
}