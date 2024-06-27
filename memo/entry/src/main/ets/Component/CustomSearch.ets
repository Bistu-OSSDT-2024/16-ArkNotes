@Component
export default struct CustomSearch{

  @Link keywords:string

  cleankeywords:()=>void = () => {
  };//添加默认初始化值

  build() {
    Row(){
      Row(){
        Image($r('app.media.search'))
          .width(16)
          .margin({left:10})
          //.padding({right:6,left:2})
        TextInput({
          placeholder:'快速搜索关键词',
          text:this.keywords
        })
          .onChange((value:string)=>{
            this.keywords = value
          })
          .backgroundColor('#FFFF')
          .opacity(0.7)
        if (this.keywords){
          Image($r('app.media.img'))
            .width(16)
            .margin({right:8,left:2})
            .onClick(()=>{
              this.cleankeywords()
            })
        }

      }
      .padding({left:8,right:45})
      //.backgroundColor('#FFFFFF')
      .borderRadius(16)
      .opacity(0.7)
    }.padding({right:20,left:20})
    .margin({top:12})
  }
}
