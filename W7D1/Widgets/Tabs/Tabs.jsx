var Tabs = React.createClass({
  getInitialState: function(){
    return {
      title: this.props.items[0].title,
      content: this.props.items[0].content
    };
  },

  handleClick: function(e){
    var newIdx = e.target.id;
    this.setState({
      title: this.props.items[newIdx].title,
      content: this.props.items[newIdx].content
    });
  },




  render: function(){
    var tabs = this.props.items.map(function(item, idx){
      if (item.title === this.state.title) {
        return (<li id={idx} key={idx} className="selected">{item.title}</li>);
      } else {
        return (<li id={idx} key={idx}>{item.title}</li>);
      }
    }.bind(this));

    return (
      <div>
        <ul onClick={this.handleClick}>{tabs}</ul>
        <article>{this.state.content}</article>
      </div>
    );
  }
});
