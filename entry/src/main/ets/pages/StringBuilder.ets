export class StringBuilder{
  result: string = "";
  append(msg?: string){
    this.result += msg;
    return this;
  }

  toString(){
    return this.result;
  }
}