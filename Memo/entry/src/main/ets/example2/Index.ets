//这是一个入口UI ，其作用是把其他组件连，把4个ets文件全部导进来
import {FruitData}from './Models'
import {TitleComponent}from './TitleComponent'
import {TableHeaderComponent}from './TableHeadComponent'
import {ItemComponent}from './ItemComponent'
@Component
@Entry

struct Index{
  @State dataSource1: FruitData[] = [
    new FruitData('1', '苹果', '12080'),
    new FruitData('2', '葡萄', '10320'),
    new FruitData('3', '西瓜', '9801'),
    new FruitData('4', '香蕉', '8431'),
    new FruitData('5', '菠萝', '7546'),
    new FruitData('6', '榴莲', '7431'),
    new FruitData('7', '红葡萄', '7187'),
    new FruitData('8', '梨子', '7003'),
    new FruitData('9', '杨桃', '6794'),
    new FruitData('10','番石榴', '6721')
  ];

  // 初始化第二个数据源，包含另一组水果的排名和得票数。
  @State dataSource2: FruitData[] = [
    new FruitData('11', '西瓜', '8836'),
    new FruitData('12', '苹果', '8521'),
    new FruitData('13', '香蕉', '8431'),
    new FruitData('14', '葡萄', '7909'),
    new FruitData('15', '红葡萄', '7547'),
    new FruitData('16', '梨子', '7433'),
    new FruitData('17', '菠萝', '7186'),
    new FruitData('18', '榴莲', '7023'),
    new FruitData('19', '番石榴', '6794'),
    new FruitData('20', '杨桃', '6721')
    ];

  //共享变量，在子组件就是link，在父组件用state

  @State
  isSwitchDataSource:boolean = true ; //控制是否切换数据源

  build() {
    Column(){
      //分为三部分
      //第一部分，标题组件
      TitleComponent({isRefreshData :$isSwitchDataSource, title : '水果排行榜'})

      //第二部分：表头组件
      TableHeaderComponent({
        paddingValue:{
          left:15,
          right:15
        },
        widthValue:'90%'
      })

        .margin({
        top:20,
        bottom:15
      })

      //第三部分:列表，单独写一个购物界函数里面去
      this.CreateArrayItemComponent()
    }
    .backgroundColor('#F1F3F5')
    .width('100%')
    .height('100%')
  }

  @Builder
  CreateArrayItemComponent(){
    //构建列表
    Column(){
      List(){
        ForEach(this.isSwitchDataSource ? this.dataSource1 : this.dataSource2, //根据状态的值
          (item:FruitData,index:number)=>{
          // 构建列表项
            ListItem(){
              ItemComponent({
                index: index + 1,
                name:item.name,
                vote:item.vote
              })
            }
          }
        )
      }
      .width('100%')
      .height('65%')
      .divider({strokeWidth:1})   // 列表项之间的分割线！！！
    }
    .padding({
      left:15,
      right:15
    })
    .width('92%')
    .borderRadius(20)
    .alignItems(HorizontalAlign.Center)  //为什么是HorizontalAlign ？？？？
    .backgroundColor(Color.White)
}
}











