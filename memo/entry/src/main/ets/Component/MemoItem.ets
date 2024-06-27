import MemoModel from '../model/MemoModel'

interface TimeFormat{
  range: string
  formatDate: string
  formatTime: string
}

function getFormatTime(timeStamp:number):TimeFormat{
  const today = new Date();
  const date = new Date(timeStamp);
  //计算日期差值
  const diffTime = today.getTime()-date.getTime();
  //向下取整
  const diffDays = Math.floor(diffTime/(24*60*60*1000));
  
  let range:string = ''

  if (diffDays === 0) {
    range = '今天'
  } else if(diffDays ===1){
    range='昨天'
  }else if (diffDays ===2){
    range = '前天'
  }else{
    range = '三天前'
  }
  const month:string =(date.getMonth()+1).toString().padStart(2,'0')
  const day:string=date.getDate().toString().padStart(2,'0')
  const hours:string=date.getHours().toString().padStart(2,'0')
  const minute:string=date.getMinutes().toString().padStart(2,'0')

  const formatDate: string = `${month}月${day}日`
  const formatTime: string = `${hours}:${minute}`

  return { range, formatDate, formatTime }

}

@Component
export default struct MemoItem{
  @ObjectLink memo : MemoModel
  onMemoClick :(memo:MemoModel)=>void=()=>{

  }


  build() {
    Row(){
      Stack() {
        Row() {
          //左侧
          Column() {

          }
          .width(26)
          .height(90)
          .linearGradient({
            direction: GradientDirection.Bottom,
            colors: [['#ffe3e3d6', 0.5], ['#ffe2d8d0', 1]]
          })
          .borderRadius({ topLeft: 4, bottomLeft: 4 })

          //纵向分割线
          Divider()
            .vertical(true)
            .height(90)
            .color('#fff5eae0')

          //右侧
          Column() {
            Row({ space: 10 }) {
              Text(getFormatTime(this.memo.updateTime).range)
                .fontSize(12).fontColor('#fffa8025')
              Text(getFormatTime(this.memo.updateTime).formatDate)
                .fontSize(12).fontColor('#fffa8025')
              Text(getFormatTime(this.memo.updateTime).formatTime)
                .fontSize(12).fontColor('#fffa8025')
            }
            .margin({ left: 20 })
            .height(25)

            Divider()
              .color('#fff5e6d7')

            Column() {
              Text(this.memo.content)
                .fontColor('#604637')
                .maxLines(2)
                .margin({ right: 10 })
            }
          }
          .alignItems(HorizontalAlign.Start)
          .linearGradient({
            direction: GradientDirection.Bottom,
            colors: [['#ffe7e9e1', 0.5], ['#ffe5e2da', 1]]
          })
          .height(90)
          .borderRadius({ topRight: 4, bottomRight: 4 })

        }
        Image($r('app.media.PaperClip'))
          .height(30)
          .offset({x:-10})
      }
      .width('100%')
      .alignContent(Alignment.Start)
      .onClick(()=>{
        this.onMemoClick(this.memo)
      })

    }
    .padding({left:20,right:20})
    .margin({right:20,top:10})
    .opacity(0.8)
  }
}
/*
@Preview
@Component
struct MemoItemPreview{

  @State memo : MemoModel = new MemoModel(1,170613,'注意需要使用时毫秒时间')

  build() {
    MemoItem({memo:this.memo})
  }
}
*/