class Task{
   String _title;
   String _description;
   bool _isDone;
    DateTime _dateTime;
    Task(this._title,this._description,this._isDone,this._dateTime);

    String get title => _title;

    String get description => _description;

    bool get isDone => _isDone;

    DateTime get dataTime=> _dateTime;

    void setTitle(String value){
      _title=value;
    }
    void setDescription(String value){
      _description=value;
    }
    void setIsDone(bool currentstate){
      _isDone=currentstate;
    }

}