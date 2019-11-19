import React from "react"
import PropTypes from "prop-types"

class FeedForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      add: false,
      title: '',
      url: '',
      urlError: ''
    };
    this.handleTitleChange = this.handleTitleChange.bind(this);
    this.handleUrlChange = this.handleUrlChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  canBeSubmitted() {
    const { title, url } = this.state;
    return (
      title.length > 0 &&
      url.length > 0 &&
      url.match(/(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})/)
    );
  }

  handleTitleChange(e) {
    this.setState({ title: e.target.value });
  }

  handleUrlChange(e) {
    this.setState({ url: e.target.value });
  }

  handleSubmit(e) {
    if (!this.canBeSubmitted()) {
      e.preventDefault();
      return (this.setState({urlError: 'error'}));
    }
    this.setState({ add: false });
  }

  render() {
    const isEnabled = this.canBeSubmitted();
    if (this.state.add == true) {
      const { title, url } = this.state;
      const isEnabled = title.length > 0 && url.length > 0;
      return (
        <React.Fragment>
        <form className="form" action="/feeds" acceptCharset="UTF-8" data-remote="true" method="post" onSubmit={this.handleSubmit} >
            <input type="hidden" name="authenticity_token" value={this.props.authenticityToken} />
          <div className="row w-100">
            <div className="col-10">
              <div className="row form-group">
                <input type="text" name="feed[title]" id="feed_title" placeholder="Titre du flux" className="form-control" value={this.state.title} onChange={this.handleTitleChange} />
              </div>
              <div className="row form-group">
                <input type="text" name="feed[url]" id="feed_url" placeholder="Url du flux" value={this.state.url} className={this.state.urlError + ' form-control'} onChange={this.handleUrlChange} />
              </div>
            </div>
            <div className="col-2 d-flex align-items-end">
              <input type="submit" name="commit" value="Ajouter le flux" className="btn btn-primary mb-3" data-disable-with="Ajouter le flux" disabled={!isEnabled} />
            </div>
          </div>
        </form>
        </React.Fragment>
        );
      }
    return (
      <button className="btn btn-primary" onClick={() => this.setState({ add: true })}>
        Ajouter un flux
      </button>
       );
}
}

export default FeedForm
