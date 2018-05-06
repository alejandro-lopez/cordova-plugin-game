var exec = require('cordova/exec');

var Game = {
	_loggedin: false,
	
	tag: '',
	
	setUp: function () {
		exec(null, null, "Game", "setUp", []);
	},
	login: function (tag) {
		var self = this;
		exec(function (result) {
			var playerDetail = result;
			self._loggedin = true;
			self.tag = tag;
			if (self.onLoginSucceeded)
				self.onLoginSucceeded(playerDetail);
		},
		function (error) {
			self.tag = tag;
			if (self.onLoginFailed)
			self.onLoginFailed();
		}, "Game", "login", []);
	},
	logout: function () {
		var self = this;
		exec(function (result) {
			self._loggedin = false;
		},
		function (error) {
		}, "Game", "logout", []);
	},
	isLoggedIn: function () {
		return this._loggedin;
	},
	submitScore: function (leaderboardId, score, tag) {
		var self = this;
		exec(function (result) {
			self.tag = tag;
			if (self.onSubmitScoreSucceeded)
			self.onSubmitScoreSucceeded();
		},
		function (error) {
			self.tag = tag;
			if (self.onSubmitScoreFailed)
			self.onSubmitScoreFailed();
		}, "Game", "submitScore", [leaderboardId, score]);
	},
	getTopScores: function (leaderboardId, resolve, reject) {
		exec(resolve, reject, "Game", "getTopScores", [leaderboardId]);
	},
	getAchievements: function (success, failure) {
		exec(success, failure, "Game", "getAchievements", []);
	},
	getLeaderboards: function () {
		return new Promise(function(resolve, reject){
			exec(resolve, reject, "Game", "getLeaderboards", []);
		})
	},
	showLeaderboard: function (leaderboardId) {
		exec(
		function (result) {
		},
		function (error) {
		}, "Game", "showLeaderboard", [leaderboardId]);
	},
	showLeaderboards: function () {
		exec(
		function (result) {
		},
		function (error) {
		}, "Game", "showLeaderboards", []);
	},
	getPlayerScore: function (leaderboardId, tag) {
		var self = this;
		exec(function (result) {
			var playerScore = result;
			self.tag = tag;
			if (self.onGetPlayerScoreSucceeded)
			self.onGetPlayerScoreSucceeded(playerScore);
		},
		function (error) {
			self.tag = tag;
			if (self.onGetPlayerScoreFailed)
			self.onGetPlayerScoreFailed();
		}, "Game", "getPlayerScore", [leaderboardId]);
	},
	unlockAchievement: function (achievementId, tag) {
		var self = this;
		exec(function (result) {
			self.tag = tag;
			if (self.onUnlockAchievementSucceeded)
			self.onUnlockAchievementSucceeded();
		},
		function (error) {
			self.tag = tag;
			if (self.onUnlockAchievementFailed)
			self.onUnlockAchievementFailed();
		}, "Game", "unlockAchievement", [achievementId]);
	},
	incrementAchievement: function (achievementId, incrementalStepOrCurrentPercent, tag) {
		var self = this;
		exec(function (result) {
			self.tag = tag;
			if (self.onIncrementAchievementSucceeded)
			self.onIncrementAchievementSucceeded();
		},
		function (error) {
			self.tag = tag;
			if (self.onIncrementAchievementFailed)
			self.onIncrementAchievementFailed();
		}, "Game", "incrementAchievement", [achievementId, incrementalStepOrCurrentPercent]);
	},
	showAchievements: function () {
		exec(
		function (result) {
		},
		function (error) {
		}, "Game", "showAchievements", []);
	},
	resetAchievements: function () {
		var self = this;
		exec(function (result) {
			if (self.onResetAchievementsSucceeded)
			self.onResetAchievementsSucceeded();
		},
		function (error) {
			if (self.onResetAchievementsFailed)
			self.onResetAchievementsFailed();
		}, "Game", "resetAchievements", []);
	},
	getPlayerImage: function () {
		var self = this;
		exec(function (result) {
			var playerImageUrl = result;
			if (self.onGetPlayerImageSucceeded)
			self.onGetPlayerImageSucceeded(playerImageUrl);
		},
		function (error) {
			if (self.onGetPlayerImageFailed)
			self.onGetPlayerImageFailed();
		}, "Game", "getPlayerImage", []);
	},
	onLoginSucceeded: null,
	onLoginFailed: null,
	onSubmitScoreSucceeded: null,
	onSubmitScoreFailed: null,
	onGetTotalScoreSucceeded: null,
	onGetTotalScoreFailed: null,
	onGetPlayerScoreSucceeded: null,
	onGetPlayerScoreFailed: null,
	onUnlockAchievementSucceeded: null,
	onUnlockAchievementFailed: null,
	onIncrementAchievementSucceeded: null,
	onIncrementAchievementFailed: null,
	onResetAchievementsSucceeded: null,
	onResetAchievementsFailed: null,
	onGetPlayerImageSucceeded: null,
	onGetPlayerImageFailed: null
};

module.exports = Game;
