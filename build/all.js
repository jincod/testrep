(function() {
  var template;

  this.GetFirstCard = function(cards) {
    var card, firstCard, isFirst, _i, _j, _len, _len1;

    for (_i = 0, _len = cards.length; _i < _len; _i++) {
      firstCard = cards[_i];
      isFirst = true;
      for (_j = 0, _len1 = cards.length; _j < _len1; _j++) {
        card = cards[_j];
        if (firstCard.from === card.to) {
          isFirst = false;
        }
      }
      if (isFirst) {
        return firstCard;
      }
    }
  };

  this.GetCardByTo = function(to, cards) {
    var card, _i, _len;

    for (_i = 0, _len = cards.length; _i < _len; _i++) {
      card = cards[_i];
      if (card.from === to) {
        return card;
      }
    }
  };

  this.TravelCardSorter = function(cards) {
    var last, next, result;

    if (cards.length < 2) {
      return cards;
    }
    result = [];
    result.push(GetFirstCard(cards));
    while (true) {
      last = result[result.length - 1];
      if (!last) {
        throw "Some cards are lost";
      }
      next = GetCardByTo(last.to, cards);
      if (!next) {
        throw "Some cards are lost";
      }
      result.push(next);
      if (result.length === cards.length) {
        break;
      }
    }
    return result;
  };

  template = "Take {{cardtype}}{{number}} from {{cardfrom}} to {{cardto}}. {{seat}}{{comments}}";

  this.ResultFormatter = function(cards) {
    var card, comments, number, result, seat, str, _i, _len;

    result = [];
    for (_i = 0, _len = cards.length; _i < _len; _i++) {
      card = cards[_i];
      seat = card.seat ? "Seat " + card.seat + "." : "No seat assignment.";
      comments = card.comments ? " " + card.comments : "";
      number = card.number ? " " + card.number : "";
      str = template.replace("{{cardtype}}", card.type).replace("{{number}}", number).replace("{{cardfrom}}", card.from).replace("{{cardto}}", card.to).replace("{{seat}}", seat).replace("{{comments}}", comments);
      result.push(str);
      console.log(str);
    }
    console.log("*****************************");
    return result;
  };

}).call(this);

(function() {
  (function(win, doc) {
    var Dom, regexp;

    win.y6 = {};
    regexp = {
      Tag: /^[-_a-z0-9]+$/i,
      Class: /^\.[-_a-z0-9]+$/i,
      Id: /^#[-_a-z0-9]+$/i
    };
    Dom = function(selector, context) {
      if (context == null) {
        context = null;
      }
      if (!(this instanceof Dom)) {
        return new Dom(selector, context);
      }
      if (selector.match(regexp.Id)) {
        this.elems = document.getElementById(selector.substr(1));
        this.elems = this.elems ? [this.elems] : [];
      }
      if (selector.match(regexp.Class)) {
        this.elems = document.getElementsByClassName(selector.substr(1));
      }
      if (selector.match(regexp.Tag)) {
        this.elems = document.getElementsByTagName(selector);
      }
      return this;
    };
    Dom.prototype.addClass = function(className) {
      var classNames, el, index, _i, _len, _ref;

      _ref = this.elems;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        el = _ref[_i];
        classNames = el.className.split(/\s+/);
        index = classNames.indexOf(className);
        if (index === -1) {
          classNames.push(className);
          el.className = classNames.join(" ").trim();
        }
      }
      return this;
    };
    Dom.prototype.hasClass = function(className) {
      var classNames, el, index, _i, _len, _ref;

      _ref = this.elems;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        el = _ref[_i];
        classNames = el.className.split(/\s+/);
        index = classNames.indexOf(className);
        if (!(index === -1)) {
          return true;
        }
      }
      return false;
    };
    Dom.prototype.removeClass = function(className) {
      var classNames, el, index, _i, _len, _ref;

      _ref = this.elems;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        el = _ref[_i];
        classNames = el.className.split(/\s+/);
        index = classNames.indexOf(className);
        if (!(index === -1)) {
          classNames.splice(index, 1);
        }
        el.className = classNames.join(" ").trim();
      }
      return this;
    };
    Dom.prototype.toggleClass = function(className) {
      var classNames, el, index, _i, _len, _ref;

      _ref = this.elems;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        el = _ref[_i];
        classNames = el.className.split(/\s+/);
        index = classNames.indexOf(className);
        if (!(index === -1)) {
          classNames.splice(index, 1);
        } else {
          classNames.push(className);
        }
        el.className = classNames.join(" ").trim();
      }
      return this;
    };
    return y6.dom = Dom;
  })(window, document);

}).call(this);
