import * as yup from "yup";
export const signinSchema = yup.object({
  email: yup.string().email().required(),
  password: yup.string().required(),
});

export type SigninDto = yup.InferType<typeof signinSchema>;
