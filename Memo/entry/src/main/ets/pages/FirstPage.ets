import router from '@ohos.router';
@Entry
@Component
struct FirstPage {
  build() {
    Row(){
      Column(){
        Text('第一个页面')
          .fontSize(40)
          .fontWeight(FontWeight.Bold)
      Blank()
        Button('跳转第二个页面')
          .fontSize(18)
          .width(300)
          .height(40)
          .backgroundColor(Color.Blue)
          .onClick(()=>{
            //页面跳转
            router.pushUrl({
              url:'pages/SecondPage',
              params:{
                sendMsg:'First页面传过来的数据'
              }

            })
          })
      }
      //压入一个页面，跳转到刚刚压入的界面
      .width('100%')
      .height(140)
    }
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}