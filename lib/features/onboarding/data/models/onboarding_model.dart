import '../../../../core/utils/assets/app_icons.dart';

class OnboardingModel {
  final String title;
  final String description;
  final String image;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    title: 'Welcome to Arabtube',
    description:
        'Welcome to our new app! Discover a new world of exciting and inspiring videos. Enjoy browsing diverse content that suits all your interests',
    image: AppIcons.onboarding_1Icon,
  ),
  OnboardingModel(
    title: 'Discover videos',
    description:
        'Discover videos and lectures that inspire you and strengthen your faith, and browse the content easily and safely.',
    image: AppIcons.onboarding_2Icon,
  ),
  OnboardingModel(
    title: 'What are you waiting for,\n come on?',
    description:
        'Join our faith-based community that encourages constructive debate and ethical and respectful exchange of opinions',
    image: AppIcons.onboarding_3Icon,
  ),
];
