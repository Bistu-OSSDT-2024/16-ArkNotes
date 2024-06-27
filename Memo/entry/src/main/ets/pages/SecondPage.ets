import router from '@ohos.router';
@Entry
@Component
struct SecondPage {
 //从路由参数中获取sendMsg的值
  @State
 message:string = (router.getParams() as Record<string,string>)['sendMsg'] ;

  build() {
    Row(){
      Column(){
        Text('第二个页面')
          .fontSize(40)
          .fontWeight(FontWeight.Bold)

        //展示前一个页面传过来的数据
        Text(this.message)
          .fontSize(20)
          .opacity(0.6)
      Blank()
        Button('返回')
          .fontSize(18)
          .width(300)
          .height(40)
          .backgroundColor(Color.Blue)
          .onClick(()=>{
            //页面跳转
            // router.pushUrl({
            //   url:'pages/FirstPage',
            //   params:{
            //     sendMsg:'First页面传过来的数据'
            //   }
            //
            // })
          })
      }
      .width('100%')
      .height(140)
    }
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}