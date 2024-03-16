import 'dart:convert';

import 'package:dart_twitter_api/twitter_api.dart';
import 'package:http/http.dart';

import '_isolates_io.dart' if (dart.library.html) '_isolates_web.dart';

/// Parses the [response] into a [Tweet] object in an isolate.
Future<Tweet> defaultTweetTransform(Response response) async {
  return await compute<String, Tweet>(_isolateTweetTransform, response.body);
}

Tweet _isolateTweetTransform(String body) {
  return Tweet.fromJson(json.decode(body));
}

/// Parses the [response] into a list of [Tweet] objects in an isolate.
Future<List<Tweet>> defaultTweetListTransform(Response response) async {
  return await compute<String, List<Tweet>>(
    _isolateTweetListTransform,
    response.body,
  );
}

List<Tweet> _isolateTweetListTransform(String body) {
  final tweets = <Tweet>[];
  print('Tweet Text body: ${body}');
  for (Map<String, dynamic> tweetJson in json.decode(body)) {
    tweets.add(Tweet.fromJson(tweetJson));
    final t = Tweet.fromJson(tweetJson);
    print('Tweet Text t: ${t}');
  }

  return tweets;
}

/// Parses the [response] into a [User] object in an isolate.
Future<User> defaultUserTransform(Response response) async {
  return await compute<String, User>(_isolateUserTransform, response.body);
}

User _isolateUserTransform(String body) {
  return User.fromJson(json.decode(body));
}

/// Parses the [response] into a list of [User] objects in an isolate.
Future<List<User>> defaultUserListTransform(Response response) async {
  return await compute<String, List<User>>(
    _isolateUserListTransform,
    response.body,
  );
}

List<User> _isolateUserListTransform(String body) {
  final users = <User>[];

  for (Map<String, dynamic> userJson in json.decode(body)) {
    users.add(User.fromJson(userJson));
  }

  return users;
}

/// Parse the [response] into a [PaginatedFollowersIds] object in an isolate.
Future<PaginatedIds> defaultPaginatedIdsTransform(Response response) async {
  return await compute<String, PaginatedIds>(
      _isolatePaginatedIdsTransform, response.body);
}

PaginatedIds _isolatePaginatedIdsTransform(String body) {
  return PaginatedIds.fromJson(json.decode(body));
}

/// Parses the [response] into a [PaginatedUsers] object in an isolate.
Future<PaginatedUsers> defaultPaginatedUsersTransform(Response response) async {
  return await compute<String, PaginatedUsers>(
      _isolatePaginatedUsersTransform, response.body);
}

PaginatedUsers _isolatePaginatedUsersTransform(String body) {
  return PaginatedUsers.fromJson(json.decode(body));
}

/// Parses the [response] into a [UploadInit] object in an isolate.
Future<UploadInit> defaultUploadInitTransform(Response response) async {
  return await compute<String, UploadInit>(
    _isolateUploadInitTransform,
    response.body,
  );
}

UploadInit _isolateUploadInitTransform(String body) {
  return UploadInit.fromJson(json.decode(body));
}

/// Parses the [response] into a [UploadStatus] object in an isolate.
Future<UploadStatus> defaultUploadStatusTransform(Response response) async {
  return await compute<String, UploadStatus>(
    _isolateUploadStatusTransform,
    response.body,
  );
}

UploadStatus _isolateUploadStatusTransform(String body) {
  return UploadStatus.fromJson(json.decode(body));
}

/// Parses the [response] into a [UploadFinalize] object in an isolate.
Future<UploadFinalize> defaultUploadFinalizeTransform(Response response) async {
  return await compute<String, UploadFinalize>(
    _isolateUploadFinalizeTransform,
    response.body,
  );
}

UploadFinalize _isolateUploadFinalizeTransform(String body) {
  return UploadFinalize.fromJson(json.decode(body));
}

/// Parses the [response] into a [Relationship] object in an isolate.
Future<Relationship> defaultRelationshipTransform(Response response) async {
  return await compute<String, Relationship>(
    _isolateRelationshipTransform,
    response.body,
  );
}

Relationship _isolateRelationshipTransform(String body) {
  return Relationship.fromJson(jsonDecode(body));
}

/// Parses the [response] into a [TweetSearch] object in an isolate.
Future<TweetSearch> defaultTweetSearchTransform(Response response) async {
  return await compute<String, TweetSearch>(
    _isolateTweetSearchTransform,
    response.body,
  );
}

TweetSearch _isolateTweetSearchTransform(String body) {
  return TweetSearch.fromJson(json.decode(body));
}

/// Parses the [response] into a list of [Friendship] objects in an isolate.
Future<List<Friendship>> defaultFriendshipsTransform(Response response) async {
  return await compute<String, List<Friendship>>(
    _isolateFriendshipsTransform,
    response.body,
  );
}

List<Friendship> _isolateFriendshipsTransform(String body) {
  final friendships = <Friendship>[];

  for (Map<String, dynamic> friendshipJson in json.decode(body)) {
    friendships.add(Friendship.fromJson(friendshipJson));
  }

  return friendships;
}

/// Parses the [response] into a list of [Trends] objects in an isolate.
Future<List<Trends>> defaultTrendsListTransform(Response response) async {
  return await compute<String, List<Trends>>(
    _isolateTrendsListTransform,
    response.body,
  );
}

List<Trends> _isolateTrendsListTransform(String body) {
  final trendsList = <Trends>[];

  for (Map<String, dynamic> trendsJson in json.decode(body)) {
    trendsList.add(Trends.fromJson(trendsJson));
  }

  return trendsList;
}

Future<List<TrendLocation>> defaultTrendLocationsTransform(
  Response response,
) async {
  return await compute<String, List<TrendLocation>>(
    _isolateTrendLocationsTransform,
    response.body,
  );
}

List<TrendLocation> _isolateTrendLocationsTransform(String body) {
  final trendLocations = <TrendLocation>[];

  for (Map<String, dynamic> trendsJson in json.decode(body)) {
    trendLocations.add(TrendLocation.fromJson(trendsJson));
  }

  return trendLocations;
}

Future<TwitterList> defaultTwitterListTransform(Response response) async {
  return await compute<String, TwitterList>(
    _isolateTwitterListTransform,
    response.body,
  );
}

TwitterList _isolateTwitterListTransform(String body) {
  return TwitterList.fromJson(json.decode(body));
}

Future<List<TwitterList>> defaultTwitterListsTransform(
  Response response,
) async {
  return await compute<String, List<TwitterList>>(
    _isolateTwitterListsTransform,
    response.body,
  );
}

List<TwitterList> _isolateTwitterListsTransform(String body) {
  final twitterLists = <TwitterList>[];

  for (Map<String, dynamic> twitterListJson in json.decode(body)) {
    twitterLists.add(TwitterList.fromJson(twitterListJson));
  }

  return twitterLists;
}

Future<PaginatedTwitterLists> defaultPaginatedTwitterListsTransform(
  Response response,
) async {
  return await compute<String, PaginatedTwitterLists>(
    _isolatePaginatedTwitterListsTransform,
    response.body,
  );
}

PaginatedTwitterLists _isolatePaginatedTwitterListsTransform(String body) {
  return PaginatedTwitterLists.fromJson(json.decode(body));
}

Future<List<int>> defaultIntListTransform(Response response) async {
  return await compute<String, List<int>>(
    _isolateIntListTransform,
    response.body,
  );
}

List<int> _isolateIntListTransform(String body) {
  return (json.decode(body) as List<dynamic>).map((e) => e as int).toList();
}

Future<Banner> defaultBannerTransform(Response response) async {
  return await compute<String, Banner>(_isolateBannerTransform, response.body);
}

Banner _isolateBannerTransform(String body) {
  return Banner.fromJson(json.decode(body));
}
