//定义APP中需要用到的数据模型

export class TeskDataModel{

  private tasks: Array<string> = [
    "早起晨练",// 数组第一个元素：早起晨练
    "准备早餐",
    "阅读名著",
    "学习ArkTS",
    "玩游戏放松一下"
  ]

  getData():Array<string>{
    return this.tasks
  }
}


//new TaskDataModel(); //示例如何创建！