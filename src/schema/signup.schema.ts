import * as yup from "yup";
export const signupSchema = yup.object({
  name: yup.string().required(),
  email: yup.string().email().required(),
  password: yup.string().required(),
});

export type SignupDto = yup.InferType<typeof signupSchema>;
