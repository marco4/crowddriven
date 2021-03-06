(function(f) {
    function t(b, d) {
        this._componentInited = !1;
        var a = this;
        this.settings = f.extend({}, f.fn.thumbGallery.defaults, d);
        this.isMobile = /Android|webOS|iPhone|iPad|iPod|sony|BlackBerry/i.test(navigator.userAgent);
        a.ic_thumb_forward = "data/icons/thumb_forward.png";
        a.ic_thumb_forward_on = "data/icons/thumb_forward_on.png";
        a.ic_thumb_backward = "data/icons/thumb_backward.png";
        a.ic_thumb_backward_on = "data/icons/thumb_backward_on.png";
        a.ic_thumb_forward_v = "data/icons/thumb_forward_v.png";
        a.ic_thumb_forward_v_on = "data/icons/thumb_forward_v_on.png";
        a.ic_thumb_backward_v = "data/icons/thumb_backward_v.png";
        a.ic_thumb_backward_v_on = "data/icons/thumb_backward_v_on.png";
        this._upEvent = this._moveEvent = this._downEvent = "";
        this.hasTouch;
        this.touchOn = !0;
        "ontouchstart" in window ? (this.hasTouch = !0, this._downEvent = "touchstart.ap", this._moveEvent = "touchmove.ap", this._upEvent = "touchend.ap") : (this.hasTouch = !1, this._downEvent = "mousedown.ap", this._moveEvent = "mousemove.ap", this._upEvent = "mouseup.ap");
        this._body = f("body");
        this._window = f(window);
        this._doc = f(document);
        this._windowResizeTimeout = 150;
        this._windowResizeTimeoutID;
        this._thumbHolderArr = [];
        this._thumbsScrollValue = 100;
        this.thumbTransitionOn = !1;
        this.boxWidth;
        this.boxHeight;
        this.thumbContainerWidth;
        this.thumbContainerHeight;
        this.thumbContainerLeft;
        this.thumbContainerTop;
        this.thumbInnerContainerSize = 0;
        this.gridArr = [];
        this.rows;
        this.columns;
        this.allColumns;
        this.allRows;
        this.lastWheelCounter = this.rowCounter = this.columnCounter = 0;
        this.scrollPaneApi;
        this.tempScrollOffset;
        this.innerSlideshowExist = !1;
        this.slideShowData = [];
        this.innerSlideshowDelay = this.settings.innerSlideshowDelay;
        this.autoPlay = this.settings.autoPlay;
        this._thumbOrientation = this.settings.thumbOrientation;
        this.buttonSpacing = this.settings.buttonSpacing;
        this._layoutType = this.settings.layoutType;
        this._moveType = this.settings.moveType;
        this.horizontalSpacing = this.settings.horizontalSpacing;
        this.verticalSpacing = this.settings.verticalSpacing;
        this.grid_direction = this.settings.direction;
        this.scrollOffset = this.settings.scrollOffset;
        this.componentWrapper = f(b);
        this.thumbContainer = this.componentWrapper.find(".thumbContainer");
        this.thumbBackward = this.componentWrapper.find(".thumbBackward").css({
            cursor: "pointer",
            display: "none"
        });
        this.thumbForward = this.componentWrapper.find(".thumbForward").css({
            cursor: "pointer",
            display: "none"
        });
        this.thumbInnerContainer = this.componentWrapper.find(".thumbInnerContainer");
        "scroll" != this._moveType && (this.isMobile || (this.thumbForward.bind("mouseover", function() {
            f(this).find("img").attr("src", "horizontal" == a._thumbOrientation ? a.ic_thumb_forward_on : a.ic_thumb_forward_v_on);
            return !1
        }).bind("mouseout", function() {
            f(this).find("img").attr("src", "horizontal" == a._thumbOrientation ? a.ic_thumb_forward : a.ic_thumb_forward_v);
            return !1
        }), this.thumbBackward.bind("mouseover", function() {
            f(this).find("img").attr("src", "horizontal" == a._thumbOrientation ? a.ic_thumb_backward_on : a.ic_thumb_backward_v_on);
            return !1
        }).bind("mouseout", function() {
            f(this).find("img").attr("src", "horizontal" == a._thumbOrientation ? a.ic_thumb_backward : a.ic_thumb_backward_v);
            return !1
        })), "grid" == this._layoutType ? (this.thumbBackward.bind(this._downEvent, function() {
            if (!a.thumbTransitionOn) {
                a.thumbTransitionOn = !0;
                var e, b;
                "horizontal" == a._thumbOrientation ? (e = parseInt(a.thumbInnerContainer.css("left"), 10), e += a.thumbContainerWidth + a.verticalSpacing, 0 < e && (e = 0), b = Math.ceil(a.thumbContainerWidth / (a.boxWidth + a.verticalSpacing)), a.lastWheelCounter += b, a.thumbInnerContainer.stop().animate({
                    left: e + "px"
                }, {
                    duration: 700,
                    easing: "easeOutQuart",
                    complete: function() {
                        a.thumbTransitionOn = !1
                    }
                })) : (e = parseInt(a.thumbInnerContainer.css("top"), 10), e += a.thumbContainerHeight + a.horizontalSpacing, 0 < e && (e = 0), b = Math.ceil(a.thumbContainerHeight / (a.boxHeight + a.horizontalSpacing)), a.lastWheelCounter += b, a.thumbInnerContainer.stop().animate({
                    top: e + "px"
                }, {
                    duration: 700,
                    easing: "easeOutQuart",
                    complete: function() {
                        a.thumbTransitionOn = !1
                    }
                }));
                return !1
            }
        }), this.thumbForward.bind(this._downEvent, function() {
            if (!a.thumbTransitionOn) {
		alert('test');
                a.thumbTransitionOn = !0;
                var e, b;
                "horizontal" == a._thumbOrientation ? (e = parseInt(a.thumbInnerContainer.css("left"), 10), e -= a.thumbContainerWidth + a.verticalSpacing, e < -a.thumbInnerContainerSize + a.thumbContainerWidth && (e = -a.thumbInnerContainerSize + a.thumbContainerWidth), b = Math.ceil(a.thumbContainerWidth / (a.boxWidth + a.verticalSpacing)), a.lastWheelCounter -= b, a.thumbInnerContainer.stop().animate({
                    left: e + "px"
                }, {
                    duration: 700,
                    easing: "easeOutQuart",
                    complete: function() {
                        a.thumbTransitionOn = !1
                    }
                })) : (e = parseInt(a.thumbInnerContainer.css("top"), 10), e -= a.thumbContainerHeight + a.horizontalSpacing, e < -a.thumbInnerContainerSize + a.thumbContainerHeight && (e = -a.thumbInnerContainerSize + a.thumbContainerHeight), b = Math.ceil(a.thumbContainerHeight / (a.boxHeight + a.horizontalSpacing)), a.lastWheelCounter -= b, a.thumbInnerContainer.stop().animate({
                    top: e + "px"
                }, {
                    duration: 700,
                    easing: "easeOutQuart",
                    complete: function() {
                        a.thumbTransitionOn = !1
                    }
                }));
                return !1
            }
        })) : (this.thumbBackward.bind(this._downEvent, function() {
            if (!a.thumbTransitionOn) {
                a.thumbTransitionOn = !0;
                var e, b, c, d;
                "horizontal" == a._thumbOrientation ? (b = a.thumbInnerContainer.width(), c = a.thumbContainer.width(), e = parseInt(a.thumbInnerContainer.css("left"), 10), d = Math.floor(c / (a.boxWidth + a.spacing)), e += d * (a.boxWidth + a.spacing), a.lastWheelCounter += d, 0 < e && (e = 0), 0 != e % (a.boxWidth + a.spacing) && (value2 = Math.floor(e / (a.boxWidth + a.spacing)), e = value2 * (a.boxWidth + a.spacing), 0 < e && (e = 0), e < -b + c && (e = -b + c)), a.thumbInnerContainer.stop().animate({
                    left: e + "px"
                }, {
                    duration: 700,
                    easing: "easeOutQuart",
                    complete: function() {
                        a.thumbTransitionOn = !1
                    }
                })) : (b = a.thumbInnerContainer.height(), c = a.thumbContainer.height(), e = parseInt(a.thumbInnerContainer.css("top"), 10), d = Math.floor(c / (a.boxHeight + a.spacing)), e += d * (a.boxHeight + a.spacing), a.lastWheelCounter += d, 0 < e && (e = 0), 0 != e % (a.boxHeight + a.spacing) && (value2 = Math.floor(e / (a.boxHeight + a.spacing)), e = value2 * (a.boxHeight + a.spacing), 0 < e && (e = 0), e < -b + c && (e = -b + c)), a.thumbInnerContainer.stop().animate({
                    top: e + "px"
                }, {
                    duration: 700,
                    easing: "easeOutQuart",
                    complete: function() {
                        a.thumbTransitionOn = !1
                    }
                }));
                return !1
            }
        }), this.thumbForward.bind(this._downEvent, function() {
            if (!a.thumbTransitionOn) {
                a.thumbTransitionOn = !0;
                var b, d, c, f;
                "horizontal" == a._thumbOrientation ? (d = a.thumbInnerContainer.width(), c = a.thumbContainer.width(), b = parseInt(a.thumbInnerContainer.css("left"), 10), f = Math.floor(c / (a.boxWidth + a.spacing)), b -= f * (a.boxWidth + a.spacing), a.lastWheelCounter -= f, b < -d + c && (b = -d + c), a.thumbInnerContainer.stop().animate({
                    left: b + "px"
                }, {
                    duration: 700,
                    easing: "easeOutQuart",
                    complete: function() {
                        a.thumbTransitionOn = !1
                    }
                })) : (d = a.thumbInnerContainer.height(), c = a.thumbContainer.height(), b = parseInt(a.thumbInnerContainer.css("top"), 10), f = Math.floor(c / (a.boxHeight + a.spacing)), b -= f * (a.boxHeight + a.spacing), a.lastWheelCounter -= f, b < -d + c && (b = -d + c), a.thumbInnerContainer.stop().animate({
                    top: b + "px"
                }, {
                    duration: 700,
                    easing: "easeOutQuart",
                    complete: function() {
                        a.thumbTransitionOn = !1
                    }
                }));
                return !1
            }
        })), this.isMobile || this.thumbContainer.bind("mousewheel", function(b, d) {
            if (a._componentInited) {
                a.thumbTransitionOn = !0;
                var c = 0 < d ? 1 : -1,
                    f, g;
                if ("grid" == a._layoutType)
                    if ("horizontal" == a._thumbOrientation) {
                        if (a.thumbInnerContainerSize == a.thumbContainerWidth) return;
                        a.columnCounter != a.lastWheelCounter && (a.columnCounter = a.lastWheelCounter);
                        a.columnCounter += c;
                        0 < a.columnCounter ? a.columnCounter = 0 : a.columnCounter < -a.allColumns + a.columns && (a.columnCounter = -a.allColumns + a.columns);
                        a.lastWheelCounter = a.columnCounter;
                        c = a.columnCounter * (a.boxWidth + a.verticalSpacing);
                        a.thumbInnerContainer.stop().animate({
                            left: c + "px"
                        }, {
                            duration: 700,
                            easing: "easeOutQuart",
                            complete: function() {
                                a.thumbTransitionOn = !1
                            }
                        })
                    } else {
                        if (a.thumbInnerContainerSize == a.thumbContainerHeight) return;
                        a.columnCounter != a.lastWheelCounter && (a.rowCounter = a.lastWheelCounter);
                        a.rowCounter += c;
                        0 < a.rowCounter ? a.rowCounter = 0 : a.rowCounter < -a.allRows + a.rows && (a.rowCounter = -a.allRows + a.rows);
                        a.lastWheelCounter = a.rowCounter;
                        c = a.rowCounter * (a.boxHeight + a.horizontalSpacing);
                        a.thumbInnerContainer.stop().animate({
                            top: c + "px"
                        }, {
                            duration: 700,
                            easing: "easeOutQuart",
                            complete: function() {
                                a.thumbTransitionOn = !1
                            }
                        })
                    } else if ("horizontal" == a._thumbOrientation) {
                    f = a.thumbInnerContainer.width();
                    g = a.thumbContainer.width();
                    if (f == g) return;
                    a.columnCounter != a.lastWheelCounter && (a.columnCounter = a.lastWheelCounter);
                    a.columnCounter += c;
                    0 < a.columnCounter ? a.columnCounter = 0 : a.columnCounter < -a.allColumns + a.columns && (a.columnCounter = -a.allColumns + a.columns);
                    a.lastWheelCounter = a.columnCounter;
                    c = a.columnCounter * (a.boxWidth + a.spacing);
                    0 < c ? c = 0 : c < -f + g && (c = -f + g);
                    0 != c % (a.boxWidth + a.spacing) && (c = Math.floor(c / (a.boxWidth + a.spacing)), c *= a.boxWidth + a.spacing, 0 < c && (c = 0), c < -f + g && (c = -f + g));
                    a.thumbInnerContainer.stop().animate({
                        left: c + "px"
                    }, {
                        duration: 700,
                        easing: "easeOutQuart",
                        complete: function() {
                            a.thumbTransitionOn = !1
                        }
                    })
                } else f = a.thumbInnerContainer.height(), g = a.thumbContainer.height(), a.rowCounter != a.lastWheelCounter && (a.rowCounter = a.lastWheelCounter), a.rowCounter += c, 0 < a.rowCounter ? a.rowCounter = 0 : a.rowCounter < -a.allRows + a.rows && (a.rowCounter = -a.allRows + a.rows), a.lastWheelCounter = a.rowCounter, c = a.rowCounter * (a.boxHeight + a.spacing), 0 < c ? c = 0 : c < -f + g && (c = -f + g), 0 != c % (a.boxHeight + a.spacing) && (c = Math.floor(c / (a.boxHeight + a.spacing)), c *= a.boxHeight + a.spacing, 0 < c && (c = 0), c < -f + g && (c = -f + g)), a.thumbInnerContainer.stop().animate({
                    top: c + "px"
                }, {
                    duration: 700,
                    easing: "easeOutQuart",
                    complete: function() {
                        a.thumbTransitionOn = !1
                    }
                });
                return !1
            }
        }), "horizontal" == this._thumbOrientation ? (this._thumbBackwardSize = this.thumbBackward.width(), this._thumbForwardSize = this.thumbForward.width()) : (this._thumbBackwardSize = this.thumbBackward.height(), this._thumbForwardSize = this.thumbForward.height()));
        this._componentFixedSize || this._window.bind("resize", function() {
            if (!a._componentInited) return !1;
            a._windowResizeTimeoutID && clearTimeout(a._windowResizeTimeoutID);
            a._windowResizeTimeoutID = setTimeout(function() {
                a._doneResizing()
            }, a._windowResizeTimeout);
            return !1
        });
        var g = 0,
            j, h, k = !1;
        this.thumbInnerContainer.children("div[class=thumbHolder]").each(function() {
            j = f(this).attr({
                "data-id-i": g,
                "data-id-j": 0
            });
            a._thumbHolderArr.push(j);
            k || (a.boxWidth = a._thumbHolderArr[0].width(), a.boxHeight = a._thumbHolderArr[0].height(), k = !0);
            if (0 < j.find("div[class='innerThumbHolder']").length) {
                a.innerSlideshowExist = !0;
                var b = [],
                    d = 0;
                j.find("div[class='innerThumbHolder']").each(function() {
                    h = f(this).attr({
                        "data-id-i": g,
                        "data-id-j": d
                    });
                    b.push(h);
                    void 0 != h.attr("data-title") && !a._isEmpty(h.attr("data-title")) && a.createTitle(h);
                    a.isMobile || h.bind("mouseenter", function(c) {
                        if (!a._componentInited) return !1;
                        c || (c = window.event);
                        c.cancelBubble ? c.cancelBubble = !0 : c.stopPropagation && c.stopPropagation();
                        c = f(c.currentTarget);
                        "undefined" !== typeof overThumb && overThumb(parseInt(c.attr("data-id-i"), 10), parseInt(c.attr("data-id-j"), 10));
                        if (void 0 != c.data("caption")) {
                            c = c.data("caption");
                            var b = a.boxHeight - parseInt(c.data("finalHeight"), 10) + 1;
                            c.stop().animate({
                                top: b + "px"
                            }, {
                                duration: 500,
                                easing: "easeOutQuint"
                            });
                            return !1
                        }
                    }).bind("mouseleave", function(c) {
                        if (!a._componentInited) return !1;
                        c || (c = window.event);
                        c.cancelBubble ? c.cancelBubble = !0 : c.stopPropagation && c.stopPropagation();
                        c = f(c.currentTarget);
                        "undefined" !== typeof outThumb && outThumb(parseInt(c.attr("data-id-i"), 10), parseInt(c.attr("data-id-j"), 10));
                        if (void 0 != c.data("caption")) return c.data("caption").stop().animate({
                            top: a.boxHeight + "px"
                        }, {
                            duration: 500,
                            easing: "easeOutQuint"
                        }), !1
                    });
                    0 < h.find("a[class=pp_content]").length && h.find("a[class=pp_content]").bind("click", function() {
                        "undefined" !== typeof detailActivated && detailActivated()
                    });
                    0 < d && h.css({
                        display: "none",
                        opacity: 0
                    });
                    d++
                });
                j.data({
                    slideArr: b,
                    position: g,
                    counter: 0
                });
                a.slideShowData[g] = a.createSlideshow(j)
            } else void 0 != j.attr("data-title") && !a._isEmpty(j.attr("data-title")) && a.createTitle(j), a.isMobile || j.bind("mouseenter", function(c) {
                if (!a._componentInited) return !1;
                c || (c = window.event);
                c.cancelBubble ? c.cancelBubble = !0 : c.stopPropagation && c.stopPropagation();
                c = f(c.currentTarget);
                "undefined" !== typeof overThumb && overThumb(parseInt(c.attr("data-id-i"), 10), parseInt(c.attr("data-id-j"), 10));
                if (void 0 != c.data("caption")) {
                    c = c.data("caption");
                    var b = a.boxHeight - parseInt(c.data("finalHeight"), 10) + 1;
                    c.stop().animate({
                        top: b + "px"
                    }, {
                        duration: 500,
                        easing: "easeOutQuint"
                    });
                    return !1
                }
            }).bind("mouseleave", function(c) {
                if (!a._componentInited) return !1;
                c || (c = window.event);
                c.cancelBubble ? c.cancelBubble = !0 : c.stopPropagation && c.stopPropagation();
                c = f(c.currentTarget);
                "undefined" !== typeof outThumb && outThumb(parseInt(c.attr("data-id-i"), 10), parseInt(c.attr("data-id-j"), 10));
                if (void 0 != c.data("caption")) return c.data("caption").stop().animate({
                    top: a.boxHeight + "px"
                }, {
                    duration: 500,
                    easing: "easeOutQuint"
                }), !1
            }), 0 < j.find("a[class=pp_content]").length && j.find("a[class=pp_content]").bind("click", function() {
                "undefined" !== typeof detailActivated && detailActivated()
            });
            g++
        });
        this._playlistLength = this._thumbHolderArr.length;
        if ("line" == this._layoutType) {
            "horizontal" == this._thumbOrientation ? (this.allColumns = this._playlistLength, this.spacing = parseInt(this._thumbHolderArr[this._playlistLength - 1].css("marginRight"), 10), this._thumbHolderArr[this._playlistLength - 1].css("marginRight", "0px")) : (this.allRows = this._playlistLength, this.spacing = parseInt(this._thumbHolderArr[this._playlistLength - 1].css("marginBottom"), 10), this._thumbHolderArr[this._playlistLength - 1].css("marginBottom", "0px"));
            g = 0;
            for (g; g < this._playlistLength; g++) this.thumbInnerContainerSize = "horizontal" == this._thumbOrientation ? this.thumbInnerContainerSize + this._thumbHolderArr[g].outerWidth(!0) : this.thumbInnerContainerSize + this._thumbHolderArr[g].outerHeight(!0);
            "horizontal" == this._thumbOrientation ? this.thumbInnerContainer.width(this.thumbInnerContainerSize) : this.thumbInnerContainer.height(this.thumbInnerContainerSize)
        }
        if ("buttons" == this._moveType && this.hasTouch) {
            var p, r, q, l, m, n = !1;
            a.thumbInnerContainer.unbind("touchstart.ap touchmove.ap touchend.ap click.ap-touchclick").bind("touchstart.ap", function(b) {
                if (!a._componentInited) return !1;
                if (!a.touchOn) return !0;
                b = b.originalEvent.touches[0];
                p = a.thumbInnerContainer.position().left;
                r = a.thumbInnerContainer.position().top;
                q = b.pageX;
                l = b.pageY;
                m = !1;
                n = !0
            }).bind("touchmove.ap", function(b) {
                if (n) {
                    b = b.originalEvent.touches[0];
                    var d;
                    "horizontal" == a._thumbOrientation ? (d = p - q + b.pageX, d > a._thumbBackwardSize ? d = a._thumbBackwardSize : d < a._getComponentSize("w") - a.thumbInnerContainerSize - a._thumbForwardSize && (d = a._getComponentSize("w") - a.thumbInnerContainerSize - a._thumbForwardSize), a.thumbInnerContainer.css("left", d + "px")) : (d = r - l + b.pageY, d > a._thumbBackwardSize ? d = a._thumbBackwardSize : d < a._getComponentSize("h") - a.thumbInnerContainerSize - a._thumbForwardSize && (d = a._getComponentSize("h") - a.thumbInnerContainerSize - a._thumbForwardSize), a.thumbInnerContainer.css("top", d + "px"));
                    m = m || 5 < Math.abs(q - b.pageX) || 5 < Math.abs(l - b.pageY);
                    return !1
                }
            }).bind("touchend.ap", function() {
                n = !1
            }).bind("click.ap-touchclick", function() {
                if (m) return m = !1
            })
        }
        this.thumbInnerContainer.css("display", "block");
        this._doneResizing();
        this._componentInited = !0;
        "undefined" !== typeof thumbGallerySetupDone && thumbGallerySetupDone();
        f(".thumb_hidden").stop().animate({
            opacity: 1
        }, {
            duration: 500,
            easing: "easeOutSine"
        });
        this.innerSlideshowExist && this.settings.innerSlideshowOn && this.toggleInnerslideShow(!0)
    }
    t.prototype = {
        toggleInnerslideShow: function(b) {
            if (this._componentInited && this.innerSlideshowExist) {
                var d = 0,
                    a = this.slideShowData.length;
                for (d; d < a; d++) void 0 != this.slideShowData[d] && (b ? this.slideShowData[d].start() : this.slideShowData[d].stop())
            }
        },
        toggleInnerslideShowNum: function(b, d) {
            this._componentInited && this.innerSlideshowExist && void 0 != this.slideShowData[b] && (d ? this.slideShowData[b].start() : this.slideShowData[b].stop())
        },
        getThumbHolder: function(b) {
            if (this._componentInited && void 0 != this._thumbHolderArr[b]) return this._thumbHolderArr[b]
        },
        createTitle: function(b) {
            var d, a, g;
            d = b.attr("data-title");
            d = f("<div/>").html(d).addClass("title").appendTo(this.componentWrapper);
            a = parseInt(d.css("paddingLeft"), 10);
            g = parseInt(d.css("paddingRight"), 10);
            parseInt(d.css("paddingTop"), 10);
            parseInt(d.css("paddingBottom"), 10);
            this.isMobile ? d.css("top", this.boxHeight - d.outerHeight() + "px") : d.css("top", this.boxHeight + "px");
            d.css("width", this.boxWidth - a - g + "px");
            d.data("finalHeight", d.outerHeight());
            d.appendTo(b);
            b.data("caption", d)
        },
        createSlideshow: function(b) {
            function d(a) {
                this.slideDiv = a;
                this.len = this.slideDiv.data("slideArr").length;
                this.counter = parseInt(this.slideDiv.data("counter"), 10);
                this.delay;
                this.timeoutID;
                this.time = 1E3;
                this.ease = "easeOutSine";
                this.running = !1
            }
            var a = this;
            d.prototype = {
                start: function() {
                    var b = this;
                    this.delay = a._randomMinMax(a.innerSlideshowDelay[0], a.innerSlideshowDelay[1]);
                    this.delay *= 1E3;
                    this.timeoutID && clearTimeout(this.timeoutID);
                    this.timeoutID = setTimeout(function() {
                        b.next()
                    }, this.delay);
                    this.running = !0
                },
                stop: function() {
                    this.timeoutID && clearTimeout(this.timeoutID);
                    this.running = !1
                },
                next: function() {
                    var a = this;
                    this.timeoutID && clearTimeout(this.timeoutID);
                    this.slideDiv.data("slideArr")[this.counter].stop().animate({
                        opacity: 0
                    }, {
                        duration: this.time,
                        easing: this.ease,
                        complete: function() {
                            f(this).css("display", "none")
                        }
                    });
                    this.counter++;
                    this.counter > this.len - 1 && (this.counter = 0);
                    this.slideDiv.data("counter", this.counter);
                    this.slideDiv.data("slideArr")[this.counter].css({
                        opacity: 0,
                        display: "block"
                    }).stop().animate({
                        opacity: 1
                    }, {
                        duration: this.time,
                        easing: this.ease,
                        complete: function() {
                            a.running && a.start()
                        }
                    })
                }
            };
            return new d(b)
        },
        checkScroll: function() {
            var b = this;
            this.scrollPaneApi ? this.scrollPaneApi.reinitialise() : (this.scrollPaneApi = this.thumbContainer.jScrollPane().data().jsp, this.thumbContainer.bind("jsp-initialised", function(b, a) {
                !a && "vertical" != this._thumbOrientation && f(".jspPane").css("left", "0px")
            }), "vertical" == this._thumbOrientation ? this.thumbContainer.jScrollPane({
                verticalDragMinHeight: 80,
                verticalDragMaxHeight: 100
            }) : (this.thumbContainer.jScrollPane({
                horizontalDragMinWidth: 80,
                horizontalDragMaxWidth: 100
            }), this.thumbContainer.bind("mousewheel", function(d, a) {
                if (b._componentInited && b.scrollPaneApi) return b.scrollPaneApi && b.scrollPaneApi.scrollByX((0 < a ? -1 : 1) * b._thumbsScrollValue), !1
            })))
        },
        toggleThumbBackward: function(b) {
            "on" == b ? this.thumbBackward.css("display", "block") : this.thumbBackward.css("display", "none")
        },
        toggleThumbForward: function(b) {
            "on" == b ? this.thumbForward.css("display", "block") : this.thumbForward.css("display", "none")
        },
        calculateGrid: function(b) {
            this.tempScrollOffset = b ? parseInt(b, 10) : this.scrollOffset;
            var d = this._getComponentSize("w"),
                a = this._getComponentSize("h");
            b = "left2right" == this.grid_direction ? !0 : !1;
            if ("horizontal" == this._thumbOrientation) {
                "scroll" == this._moveType && (a -= this.tempScrollOffset);
                this.rows = Math.floor(a / (this.boxHeight + this.horizontalSpacing));
                this.rows * (this.boxHeight + this.horizontalSpacing) + this.boxHeight <= a && (this.rows += 1);
                this.columns = Math.floor(d / (this.boxWidth + this.verticalSpacing));
                this.allColumns = Math.ceil(this._playlistLength / this.rows);
                d = this.allColumns < this.columns ? this.allColumns : this.columns;
                this.gridArr = this.createGrid(this.allColumns, this.rows, this.boxWidth, this.boxHeight, this.horizontalSpacing, this.verticalSpacing, 0, 0, b);
                if (void 0 == this.gridArr[0]) return alert("Improper grid dimesions!"), !1;
                this.thumbInnerContainerSize = this.allColumns * this.boxWidth + (this.allColumns - 1) * this.verticalSpacing;
                this.thumbContainerWidth = d * this.boxWidth + (d - 1) * this.verticalSpacing;
                this.thumbContainerHeight = this.rows * this.boxHeight + (this.rows - 1) * this.horizontalSpacing
            } else {
                "scroll" == this._moveType && (d -= this.tempScrollOffset);
                this.columns = Math.floor(d / (this.boxWidth + this.verticalSpacing));
                this.columns * (this.boxWidth + this.verticalSpacing) + this.boxWidth <= d && (this.columns += 1);
                this.rows = Math.floor(a / (this.boxHeight + this.horizontalSpacing));
                this.allRows = Math.ceil(this._playlistLength / this.columns);
                d = this.allRows < this.rows ? this.allRows : this.rows;
                this.gridArr = this.createGrid(this.columns, this.allRows, this.boxWidth, this.boxHeight, this.horizontalSpacing, this.verticalSpacing, 0, 0, b);
                if (void 0 == this.gridArr[0]) return alert("Improper grid dimesions!"), !1;
                this.thumbInnerContainerSize = this.allRows * this.boxHeight + (this.allRows - 1) * this.horizontalSpacing;
                this.thumbContainerWidth = this.columns * this.boxWidth + (this.columns - 1) * this.verticalSpacing;
                this.thumbContainerHeight = d * this.boxHeight + (d - 1) * this.horizontalSpacing
            }
        },
        layoutTypeGrid: function() {
            var b = 0;
            for (b; b < this._playlistLength; b++) f(this._thumbHolderArr[b]).css({
                left: this.gridArr[b].x + "px",
                top: this.gridArr[b].y + "px"
            });
            var b = this._getComponentSize("w"),
                d = this._getComponentSize("h");
            this.thumbContainerLeft = Math.ceil(b / 2 - this.thumbContainerWidth / 2);
            this.thumbContainerTop = Math.ceil(d / 2 - this.thumbContainerHeight / 2);
            if ("scroll" != this._moveType) {
                if ("horizontal" == this._thumbOrientation) {
                    var a = parseInt(this.thumbInnerContainer.css("left"), 10);
                    a < -this.thumbInnerContainerSize + this.thumbContainerWidth && (a = -this.thumbInnerContainerSize + this.thumbContainerWidth, this.thumbInnerContainer.css("left", a + "px"));
                    this.thumbInnerContainerSize > this.thumbContainerWidth ? (this.thumbBackward.css("display", "block"), this.thumbForward.css("display", "block"), this.touchOn = !0) : (this.thumbBackward.css("display", "none"), this.thumbForward.css("display", "none"), this.thumbInnerContainer.css("left", "0px"), this.touchOn = !1);
                    d = this.thumbContainerLeft - this._thumbBackwardSize - this.buttonSpacing;
                    0 > d && (d = 0);
                    a = this.thumbContainerLeft + this.thumbContainerWidth + this.buttonSpacing;
                    a > b - this._thumbForwardSize && (a = b - this._thumbForwardSize);
                    this.thumbBackward.css("left", d + "px");
                    this.thumbForward.css("left", a + "px")
                } else a = parseInt(this.thumbInnerContainer.css("top"), 10), a < -this.thumbInnerContainerSize + this.thumbContainerHeight && (a = -this.thumbInnerContainerSize + this.thumbContainerHeight, this.thumbInnerContainer.css("top", a + "px")), this.thumbInnerContainerSize > this.thumbContainerHeight ? (this.thumbBackward.css("display", "block"), this.thumbForward.css("display", "block"), this.touchOn = !0) : (this.thumbBackward.css("display", "none"), this.thumbForward.css("display", "none"), this.thumbInnerContainer.css("top", "0px"), this.touchOn = !1), b = this.thumbContainerTop - this._thumbBackwardSize - this.buttonSpacing, 0 > b && (b = 0), a = this.thumbContainerTop + this.thumbContainerHeight + this.buttonSpacing, a > d - this._thumbForwardSize && (a = d - this._thumbForwardSize), this.thumbBackward.css("top", b + "px"), this.thumbForward.css("top", a + "px");
                this.thumbContainer.css({
                    width: this.thumbContainerWidth + "px",
                    height: this.thumbContainerHeight + "px",
                    left: this.thumbContainerLeft + "px",
                    top: this.thumbContainerTop + "px"
                })
            } else "horizontal" == this._thumbOrientation ? (this.thumbContainerTop -= this.tempScrollOffset / 2, this.thumbContainerHeight += this.tempScrollOffset) : (this.thumbContainerLeft -= this.tempScrollOffset / 2, this.thumbContainerWidth += this.tempScrollOffset), this.thumbContainer.css({
                width: this.thumbContainerWidth + "px",
                height: this.thumbContainerHeight + "px"
            }), "horizontal" == this._thumbOrientation ? this.thumbInnerContainer.css({
                width: this.thumbInnerContainerSize + "px",
                height: this.thumbContainerHeight + "px"
            }) : this.thumbInnerContainer.css({
                width: this.thumbContainerWidth + "px",
                height: this.thumbInnerContainerSize + "px"
            })
        },
        layoutTypeLine: function() {
            this._getComponentSize("w");
            this._getComponentSize("h");
            if ("horizontal" == this._thumbOrientation) {
                if ("scroll" != this._moveType) {
                    var b = this.thumbInnerContainer.width(),
                        d = this.thumbContainer.width();
                    if (this.thumbInnerContainerSize > d) {
                        this.thumbBackward.css("display", "block");
                        this.thumbForward.css("display", "block");
                        this.touchOn = !0;
                        var a = parseInt(this.thumbInnerContainer.css("left"), 10);
                        a < d - b ? a = d - b : 0 < a && (a = 0);
                        this.thumbInnerContainer.css("left", a + "px")
                    } else this.thumbBackward.css("display", "none"), this.thumbForward.css("display", "none"), this.touchOn = !1, this.thumbInnerContainer.css("left", d / 2 - b / 2 + "px")
                }
            } else "scroll" != this._moveType && (b = this.thumbInnerContainer.height(), d = this.thumbContainer.height(), this.thumbInnerContainerSize > d ? (this.thumbBackward.css("display", "block"), this.thumbForward.css("display", "block"), this.touchOn = !0, a = parseInt(this.thumbInnerContainer.css("top"), 10), a < d - b ? a = d - b : 0 < a && (a = 0), this.thumbInnerContainer.css("top", a + "px")) : (this.thumbBackward.css("display", "none"), this.thumbForward.css("display", "none"), this.touchOn = !1, this.thumbInnerContainer.css("top", d / 2 - b / 2 + "px")))
        },
        _getComponentSize: function(b) {
            return "w" == b ? this.componentWrapper.width() : this.componentWrapper.height()
        },
        _randomMinMax: function(b, d) {
            return Math.random() * (d - b) + b
        },
        _stringCounter: function(b) {
            return 9 > b ? "0" + (b + 1) : b + 1
        },
        _preventSelect: function(b) {
            f(b).each(function() {
                f(this).attr("unselectable", "on").css({
                    "-moz-user-select": "none",
                    "-webkit-user-select": "none",
                    "user-select": "none"
                }).each(function() {
                    this.onselectstart = function() {
                        return !1
                    }
                })
            })
        },
        _doneResizing: function() {
            "grid" == this._layoutType ? (this.calculateGrid(this.scrollOffset), "scroll" == this._moveType && ("horizontal" == this._thumbOrientation ? this.thumbInnerContainerSize <= this.thumbContainerWidth && this.calculateGrid("0") : this.thumbInnerContainerSize <= this.thumbContainerHeight && this.calculateGrid("0")), this.layoutTypeGrid(this.scrollOffset)) : ("horizontal" == this._thumbOrientation ? this.columns = this.thumbContainer.width() / this._thumbHolderArr[0].outerWidth(!0) : this.rows = this.thumbContainer.height() / this._thumbHolderArr[0].outerHeight(!0), this.layoutTypeLine());
            "scroll" == this._moveType && this.checkScroll()
        },
        _isEmpty: function(b) {
            return 0 == b.replace(/^\s+|\s+$/g, "").length
        },
        createGrid: function(b, d, a, f, j, h, k, p, r) {
            for (var q = [], l, m, n, e = b * d, s = 0; s < e; s++) l = {}, r ? (m = s % b, n = Math.floor(s / b), l.x = m * (a + j) + k, l.y = n * (f + h) + p) : (m = s % d, n = Math.floor(s / d), l.x = n * (a + j) + k, l.y = m * (f + h) + p), q.push(l);
            return q
        }
    };
    f.fn.thumbGallery = function(b) {
        return this.each(function() {
            var d = !1,
                a = document.URL,
                g = a.indexOf("://") + 3,
                j = a.indexOf("/", g),
                a = a.substring(g, j).split("."),
                g = [1059, 653, 1728],
                j = [],
                h, k, p, r, q = a.length,
                l, m;
            for (h = 0; h < q; h++) {
                m = a[h];
                l = m.length;
                p = k = 0;
                for (k; k < l; k++) r = m.charAt(k), p += r.charCodeAt(0);
                j.push(p)
            }
            h = 0;
            q = j.length;
            l = g.length;
            h;
            a: for (; h < q; h++) {
                k = 0;
                for (k; k < l; k++)
                    if (j[h] == g[k]) {
                        d = !0;
                        break a
                    }
            }
            if (d) {
                var n = new t(f(this), b);
                f(this).data("thumbGallery", n);
                f.fn.thumbGallery.toggleInnerslideShow = function(a) {
                    n.toggleInnerslideShow(a)
                };
                f.fn.thumbGallery.toggleInnerslideShowNum = function(a, b) {
                    n.toggleInnerslideShowNum(a, b)
                };
                f.fn.thumbGallery.getThumbHolder = function(a) {
                    return n.getThumbHolder(a)
                }
            }
        })
    };
    f.fn.thumbGallery.defaults = {};
    f.fn.thumbGallery.settings = {}
})(jQuery);

