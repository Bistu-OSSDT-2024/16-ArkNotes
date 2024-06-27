@Component
  // default 当导入文件时默认自动导入c
export default struct ItemComponent{

  private task_content: string = "" ;
  //待办任务的内容

  @State isComplete: boolean = false //是否完成任务的标记

  @Builder  //要写2个图标，代码复杂，<构建函数>,构建图标组件，重复调用
  CreateIcon(icon:Resource){
    Image(icon)
      .width(28)
      .height(28)
      .objectFit(ImageFit.Contain)
      .margin(20)
  }

  build() { //构建一个任务的UI界面：图标+文字
    Row() {
      //第一个图标，需要条件渲染，要知道是否勾上-->添加属性 State
      if (this.isComplete) {
        this.CreateIcon($r('app.media.ic_ok'))
      } else {
        this.CreateIcon($r('app.media.ic_default'))
      }
      //第二个是文本


      Text(this.task_content)
        .fontSize(20)
        .fontWeight(500)
        .decoration( { type : this.isComplete ? TextDecorationType.LineThrough : TextDecorationType.None})  // 根据任务是否完成确定删除线
        .opacity(this.isComplete ? 0.5 : 1)    //根据任务是否完成设置透明度

    }
    //一行是一个任务
    .borderRadius(84)
    .backgroundColor(Color.White)
    .width('93%')
    .height(65)
    .onClick( ()=>{
      this.isComplete = ! this.isComplete
    })




  }
}

