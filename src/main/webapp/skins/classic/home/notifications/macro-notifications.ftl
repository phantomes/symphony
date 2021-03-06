<#macro notifications type>
<#include "../../macro-head.ftl">
<#include "../../macro-pagination.ftl">
<!DOCTYPE html>
<html>
    <head>
        <@head title="${messageLabel} - ${userName} - ${symphonyLabel}">
        <meta name="robots" content="none" />
        </@head>
        <link type="text/css" rel="stylesheet" href="${staticServePath}/css/home${miniPostfix}.css?${staticResourceVersion}" />
        <link type="text/css" rel="stylesheet" href="${staticServePath}/js/lib/highlight.js-8.6/styles/github.css">
    </head>
    <body>
        <#include "../../header.ftl">
        <div class="main">
            <div class="wrapper">
                <div class="content">
                    <div class="list">
                        <#nested>
                    </div>
                </div>
                <div class="side">
                    <#include '../../common/person-info.ftl'/>
                    <nav class="home-menu">
                        <a href="${servePath}/notifications/commented"<#if type == "commented"> class="current"</#if>>
                           <span>${notificationCommentedLabel}</span>
                            <#if unreadCommentedNotificationCnt &gt; 0>
                            <span class="count">${unreadCommentedNotificationCnt}</span>
                            <span onclick="Settings.makeNotificationRead('commented')" 
                                  aria-label="${makeAsReadLabel}" class="fn-right tooltipped tooltipped-nw">
                                <svg height="18" viewBox="0 0 12 16" width="12">${checkIcon}</svg>
                            </span>
                            </#if>
                        </a> 
                        <a href="${servePath}/notifications/reply"<#if type == "reply"> class="current"</#if>>
                           <span>${notificationReplyLabel}</span>
                            <#if unreadReplyNotificationCnt &gt; 0>
                            <span class="count">${unreadReplyNotificationCnt}</span>
                            <span onclick="Settings.makeNotificationRead('reply')" 
                                  aria-label="${makeAsReadLabel}" class="fn-right tooltipped tooltipped-nw">
                                <svg height="18" viewBox="0 0 12 16" width="12">${checkIcon}</svg>
                            </span>
                            </#if>
                        </a> 
                        <a href="${servePath}/notifications/at"<#if type == "at"> class="current"</#if>>
                           <span>${notificationAtLabel}</span>
                            <#if unreadAtNotificationCnt &gt; 0>
                            <span class="count">${unreadAtNotificationCnt}</span>
                            <span onclick="Settings.makeNotificationRead('at')" 
                                  aria-label="${makeAsReadLabel}" class="fn-right tooltipped tooltipped-nw">
                                <svg height="18" viewBox="0 0 12 16" width="12">${checkIcon}</svg>
                            </span>
                            </#if>
                        </a>
                        <a href="${servePath}/notifications/following-user"<#if type == "followingUser"> class="current"</#if>>
                           <span>${notificationFollowingUserLabel}</span>
                            <#if unreadFollowingUserNotificationCnt &gt; 0>
                            <span class="count">${unreadFollowingUserNotificationCnt}</span>
                            <span onclick="Settings.makeNotificationRead('followingUser')" 
                                  aria-label="${makeAsReadLabel}" class="fn-right tooltipped tooltipped-nw">
                                <svg height="18" viewBox="0 0 12 16" width="12">${checkIcon}</svg>
                            </span>
                            </#if>
                        </a>
                        <a href="${servePath}/notifications/point"<#if type == "point"> class="current"</#if>>
                           <span>${pointLabel}</span>
                            <#if unreadPointNotificationCnt &gt; 0>
                            <span class="count">${unreadPointNotificationCnt}</span>
                            </#if>
                        </a>
                        <a href="${servePath}/notifications/broadcast"<#if type == "broadcast"> class="current"</#if>>
                           <span>${sameCityLabel}</span>
                            <#if unreadBroadcastNotificationCnt &gt; 0>
                            <span class="count">${unreadBroadcastNotificationCnt}</span>
                            </#if>
                        </a>
                    </nav>
                </div>
            </div>
        </div>
        <#include "../../footer.ftl">
        <script type="text/javascript" src="${staticServePath}/js/settings${miniPostfix}.js?${staticResourceVersion}"></script>
        <script>
            Settings.initHljs();
            $(document).bind('keyup', 'e', function assets() {
                $('.home-menu .current .tooltipped').click();
                return false;
            });
        </script>
    </body>
</html>
</#macro>
