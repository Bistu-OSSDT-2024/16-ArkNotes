import { TeskDataModel }  from './Models'
import ItemComponent from './ItemComponent'
import router from '@ohos.router';
//需要用到子组件，和其他里面的数据


@Entry
@Component
export struct TaskListIndex{
  private totalData: Array<String> = []   //待办列表中的所有数据

  aboutToAppear(): void {   //初始化数据,如果在Column里面会导致频繁的初始化
    this.totalData = new TeskDataModel().getData()
  }
  build(){   //构建入口的UI界面
    Stack(){
      Image($r('app.media.123'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)

      Column( {space :6}) { // 定义每个元素之间的间距

        Text('待办')
          .fontSize(28)
          .lineHeight(33)
          .fontWeight(FontWeight.Bold)
          .width('80%')
          .margin({
            top: -200,
            bottom: 12
          })
          .textAlign(TextAlign.Start)

        //循环渲染!!!
        ForEach(this.totalData,(item:string)=>{
          ItemComponent({task_content : item })
        })

      }

      Row(){
        Button('→')
          .fontSize(18)
          .fontColor('#000000')
          .backgroundColor('rgba(255, 255, 255, 0.5)') // 设置背景色为半透明的白色
          .borderRadius('50%') // 设置边框半径为50%，使其成为圆形
          .width(50)
          .height(40)
          .onClick(() => {
            // 点击按钮时，跳转到另一个界面

            router.pushUrl({
              url:'pages.Index',
            })
          })

          .margin({ left: 260 ,top:'50%' })
      }

    }

    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}