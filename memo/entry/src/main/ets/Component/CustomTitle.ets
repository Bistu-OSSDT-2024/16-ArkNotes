@Component
export default struct CustomTitle {
  @Link order: boolean
  @Link isAddDialogShow: boolean

  // 重用样式 @Styles
  @Styles titleButtonStyle(){
    .width(56)
    .height(32)
    .borderWidth(1)
    .borderColor('#604637')
    .borderRadius(4)
  }

  build() {

    Row() {
      // 排序
      Column() {
        Image($r('app.media.list'))
          .width(19)
          .height(23)
      }
      .titleButtonStyle()
      .justifyContent(FlexAlign.Center)
      .margin({ left: 20 })
      .onClick(() => {
        //this.order = !this.order
        ActionSheet.show({
          title: '请选择笔记排列顺序',
          subtitle: 'Please choose the order of note arrangement',
          // message: 'message',
          autoCancel: true,
          confirm: {
            defaultFocus: true,
            value: 'Confirm button',
            action: () => {
              console.log('Get Alert Dialog handled')
            }
          },
          cancel: () => {
            console.log('actionSheet canceled')
          },
          onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
            console.info("reason=" + JSON.stringify(dismissDialogAction.reason))
            console.log("dialog onWillDismiss")
            if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
              dismissDialogAction.dismiss()
            }
            if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
              dismissDialogAction.dismiss()
            }
          },
          alignment: DialogAlignment.Bottom,
          offset: { dx: 0, dy: -10 },
          sheets: [
            {
              title: '升序',
              action: () => {
                this.order = true
              }
            },
            {
              title: '降序',
              action: () => {
                this.order = false
              }
            }
          ],
          message: ''
        })
      })

      Blank()
      // 标题
      Text('Memo')
        .fontColor('#FFFEFC')
        .fontSize('24')
        .fontWeight(600)

      Blank()
      // 新建笔记
      Column() {
        Image($r('app.media.write'))
          .width(18)
      }
      .titleButtonStyle()
      .justifyContent(FlexAlign.Center)
      .margin({ right: 20 })
      .onClick(() => {
        this.isAddDialogShow = true
      })

    }
    .width('100%')
    .height(60)
    .linearGradient({
      direction: GradientDirection.Bottom,
      colors: [['#7B6558', 0.5], ['#725A4E', 1]]
    })
    .shadow({
      radius: 10,
      color: 'rgba(0,0,0,0.3)',
      offsetX: 0,
      offsetY: 10
    })
  }
}