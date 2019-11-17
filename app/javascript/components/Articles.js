import React from "react"
import PropTypes from "prop-types"
class Articles extends React.Component {
  render () {
    return (
      <React.Fragment>
      <h2>Composant react Articles</h2>
      <h4>Articles</h4>
      <ul>
        {this.props.articles.map(({id, title, summary, date, status, link }) => (
          <li key={id}>
            <h6>{date} - {title}</h6>
            <p>{summary}</p>
          </li>
          )) }
      </ul>
      </React.Fragment>
    );
  }
}

Articles.propTypes = {
  articles: PropTypes.array
};
export default Articles
