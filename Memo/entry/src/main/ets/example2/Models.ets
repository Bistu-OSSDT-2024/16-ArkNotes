// 水果对象
export class FruitData{

  name:string;
  vote:string;
  id:string;

  constructor(id:string,name:string ,vote:string) {
    this.name = name ;
    this.vote = vote ;
    this.id = id ;
  }
}